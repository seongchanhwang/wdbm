/*제품등록 상세검색*/
function productSearch(){
	var	type = $("#search_item").val();
	var keyword = $("#keyword").val();
	  
	location.href="productRegists.do?type="+type+"&keyword="+keyword	
}

/*두께 상세검색*/
function thicknessSearch(){
	var	type = $("#search_item").val();
	var keyword = $("#keyword").val();
	  
	location.href="productThickness.do?type="+type+"&keyword="+keyword	
}

/*사이즈 상세검색*/
function sizeSearch(){
	var	type = $("#search_item").val();
	var keyword = $("#keyword").val();
	  
	location.href="productSize.do?type="+type+"&keyword="+keyword	
}
//
///*제품상세설정 상세검색*/
//function sizeSearch(){
//	var	type = $("#search_item").val();
//	var keyword = $("#keyword").val();
//	  
//	location.href="productDetail.do?type="+type+"&keyword="+keyword	
//}

/*두께 상세검색*/
function detailSearch(){
	var	type = $("#search_item").val();
	var keyword = $("#keyword").val();
	  
	location.href="productDetail.do?type="+type+"&keyword="+keyword	
}

/*제품명 한페이지당 게시물 */
function productPage(idx){
  var pagenum = idx == undefined? 1:idx ;
  var contentnum = $("#contentnum option:selected").val();
  var type = $("#search_item").val();
  var keyword = $("#keyword").val();

  if(contentnum == 10){
    location.href="productRegists.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;

  }else if(contentnum == 20){
    location.href="productRegists.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;

  }else if(contentnum == 30){
    location.href="productRegists.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;
  }
}

/*제품두께 한페이지당 게시물 */
function thicknessPage(idx){
	var pagenum = idx == undefined? 1:idx ;
  var contentnum = $("#contentnum option:selected").val();
  var type = $("#search_item").val();
  var keyword = $("#keyword").val();

  if(contentnum == 10){
    location.href="productThickness.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;

  }else if(contentnum == 20){
    location.href="productThickness.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;

  }else if(contentnum == 30){
    location.href="productThickness.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;
  }
}

/*사이즈 한페이지당 게시물 */
function detailPage(idx){
  var pagenum = idx == undefined? 1:idx ;
  var contentnum = $("#contentnum option:selected").val();
  var type = $("#search_item").val();
  var keyword = $("#keyword").val();

  if(contentnum == 10){
    location.href="productDetail.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;

  }else if(contentnum == 20){
    location.href="productDetail.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;

  }else if(contentnum == 30){
    location.href="productDetail.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;
  }
}

/*제품상세등록  한페이지당 게시물 */
function sizePage(idx){
  var pagenum = idx == undefined? 1:idx ;
  var contentnum = $("#contentnum option:selected").val();
  var type = $("#search_item").val();
  var keyword = $("#keyword").val();
  
  console.log(keyword);

  if(contentnum == 10){
    location.href="productSize.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;

  }else if(contentnum == 20){
    location.href="productSize.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;

  }else if(contentnum == 30){
    location.href="productSize.do?pagenum="+pagenum+"&contentnum="+contentnum+"&keyword="+keyword+"&type="+type;
  }
}

/*제품상세등록 제품명 바뀔 때 두께 조회해오기*/
function detailNmChange(){
	var name = $("#productNm").val();
	$.ajax({
		url: "selectDetailThickness.do",
		data: {"name":name},
		type: "POST",
		success : function(data){

	    	$("#thickness").children().remove();
	    	$("#thickness").append('<option value="">제품두께 선택</option>');
	    	$("#size").children().remove();
	    	$("#size").append('<option value="">제품사이즈 선택</option>');
	    	
		    for (var i in data.thickness) {
		    	var custom = '';
		    	if(data.thickness[i].CUSTOM_ORDER == 'Y'){
		    		custom = " (주문제작)";
		    	}
		    	var child = "<option value="+data.thickness[i].THICKNESS+">"+data.thickness[i].THICKNESS+custom+"</option>;";
		    	$("#thickness").append(child);
		      }
		    
		    for (var i in data.size) {
		    	var custom = '';
		    	if(data.size[i].CUSTOM_ORDER == 'Y'){
		    		custom = " (주문제작)";
		    	}
		    	var size = "("+data.size[i].HEIGHT + "*" + data.size[i].WIDTH +")";
		    	var child = "<option value="+data.size[i].SIZE+">"+data.size[i].SIZE+size+custom+"</option>;";
		    	$("#size").append(child);
		      }
		    
		    if($('#origThickness').length > 0){				
				$("#thickness").val($("#origThickness").val()).prop("selected", true);
				$("#size").val($("#origSize").val()).prop("selected", true);	
		    }

		},
		error : function(){
			alert("에러가 발생했습니다.");		
		}
	});
}

function registsType(fileId, fileNm){
	var form = $("form").serialize();
	var update = $("#update").val();
	form = form + "&fileId=" + fileId+ "&fileNm=" + fileNm;
	
	if(update =='update'){
		console.log('update들어옵');
		$.ajax({
			url: "updateProductType.do",
			data: form,
			type: "POST",
			dataType: "json",
			success : function(data){
				alert("저장에 성공했습니다.");
				checkUnload = false;
				location.href = "productRegists.do";
			},
			error : function(){
				alert("에러가 발생했습니다.");		
			}
		});		
	} else {
		$.ajax({
			url: "addProductType.do",
			data: form,
			type: "POST",
			dataType: "json",
			success : function(data){
				alert("저장에 성공했습니다.");
				checkUnload = false;
				location.href = "productRegists.do";
			},
			error : function(){
				alert("에러가 발생했습니다.");		
			}
		});
	}
	checkUnload = false;
}

function checkFileName(str){
	 
    //1. 확장자 체크
    var ext =  str.split('.').pop().toLowerCase();
    if($.inArray(ext, ['pdf']) == -1) {
 
        //alert(ext);
        alert(ext+'파일은 업로드 하실 수 없습니다.');
        return false;
    }
 
    //2. 파일명에 특수문자 체크
    var pattern =   /[\{\}\/?,;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
    if(pattern.test(str) ){
        //alert("파일명에 허용된 특수문자는 '-', '_', '(', ')', '[', ']', '.' 입니다.");
        alert('파일명에 특수문자를 제거해주세요.');
        return false;
    }
    
    return true;
}

function registsThickness(fileId, fileNm){
	var form = $("form").serialize();
	var update = $("#update").val();
	form = form + "&fileId=" + fileId+ "&fileNm=" + fileNm;
	
	if(update =='update'){
		console.log('update');
		
		$.ajax({
			url: "updateProductThickness.do",
			data: form,
			type: "POST",
			dataType: "json",
			success : function(data){
				alert("저장에 성공했습니다.");
				checkUnload = false;
				location.href = "productThickness.do";
			},
			error : function(){
				alert("에러가 발생했습니다.");		
			}
		});		
	} else {
		$.ajax({
			url: "addProductThickness.do",
			data: form,
			type: "POST",
			dataType: "json",
			success : function(data){
				alert("저장에 성공했습니다.");
				checkUnload = false;
				location.href = "productThickness.do";
			},
			error : function(){
				alert("에러가 발생했습니다.");		
			}
		});
	}
	checkUnload = false;
}

$(document).ready(function(){
	if($("#pagename") != null & $("#pagename").val() =='detail'){
		detailNmChange();
	}
	//제품명 폼 제출
	$("#typeForm").submit(function(event){
		event.preventDefault();
		var form = $("form")[0];        
	 	var formData = new FormData(form);
	 	var fileOrigId = $("#origFile").val();
	 	var fileOrigNm = $("#origFileNm").val();
		var field = document.querySelector("#attach1");

		var fileNm = '';
		if(field){

			var content_files = document.querySelector("#attach1").files;
			
			for (var x = 0; x < content_files.length; x++) {
				// 삭제 안한것만 담아 준다. 
				if(!content_files[x].is_delete){
					 formData.append("article_file", content_files[x]);
					 formData.append("filePath", "/main");
				}
			}

			var fileId;
			if(content_files.length > 0){
				fileNm = content_files[0].name;
				$.ajax({
			   	      type: "POST",
			   	   	  enctype: "multipart/form-data",
			   	      url: "/fileUpload",
			       	  data : formData,
			       	  processData: false,
			   	      contentType: false,
			   	      success: function (data) {
			   	    	  fileId = data.fileId;
			   	    	  registsType(fileId, fileNm);
			   	      },
					error : function(){
						alert("에러가 발생했습니다.");		
					}
				});
			} else {
				registsType(fileOrigId,fileOrigNm);
			}
		} else {
			registsType('');			
		}
	});	

	//두께 폼 제출
	$("#thicknessForm").submit(function(event){
		event.preventDefault();
		var form = $("form")[0];        
	 	var formData = new FormData(form);
	 	var fileOrigId = $("#origFile").val();
	 	var fileOrigNm = $("#origFileNm").val();
		var field = document.querySelector("#attach1");

		var fileNm = '';
		if(field){
			var content_files = document.querySelector("#attach1").files;

			for (var x = 0; x < content_files.length; x++) {
				// 삭제 안한것만 담아 준다. 
				if(!content_files[x].is_delete){
					 formData.append("article_file", content_files[x]);
					 formData.append("filePath", "/main");
				}
			}

			var fileId;
			console.log(fileOrigId);
			if(content_files.length > 0){
				fileNm = content_files[0].name;
				$.ajax({
			   	      type: "POST",
			   	   	  enctype: "multipart/form-data",
			   	      url: "/fileUpload",
			       	  data : formData,
			       	  processData: false,
			   	      contentType: false,
			   	      success: function (data) {
			   	    	  fileId = data.fileId;
			   	    	  registsThickness(fileId, fileNm);
			   	      },
					error : function(){
						alert("에러가 발생했습니다.");		
					}
				});
			} else if(content_files.length==0 && fileOrigId == undefined){
				registsThickness('');
			} else {
				registsThickness(fileOrigId,fileOrigNm);
			}
		} else {
			registsThickness('');			
		}
	});
	
	//사이즈 폼 제출
	$("#sizeForm").submit(function(event){
		event.preventDefault();
		var form = $("form").serialize();

		$.ajax({
			url: "addProductSize.do",
			data: form,
			type: "POST",
			dataType: "json",
			success : function(data){
				alert("저장에 성공했습니다.");
				checkUnload = false;
				location.href = "productSize.do";
			},
			error : function(){
				alert("에러가 발생했습니다.");		
			}
		});
		checkUnload = false;
	});
	
	//사이즈 폼 제출
	$("#detailForm").submit(function(event){
		event.preventDefault();
		var update = $("#update").val();
		var form = $("form").serialize();
		
		if(update == 'update'){
			$.ajax({
				url: "updateProductDetail.do",
				data: form,
				type: "POST",
				dataType: "json",
				success : function(data){
					console.log(data);
//					alert("저장에 성공했습니다.");
					checkUnload = false;
					location.href = "productDetail.do";
				},
				error : function(){
					alert("에러가 발생했습니다.");		
				}
			});			
		} else {
			$.ajax({
				url: "addProductDetail.do",
				data: form,
				type: "POST",
				dataType: "json",
				success : function(data){
					alert("저장에 성공했습니다.");
					checkUnload = false;
					location.href = "productDetail.do";
				},
				error : function(){
					alert("에러가 발생했습니다.");		
				}
			});			
		}

		checkUnload = false;
	});
	
	//전체체크박스
	$("#allListCheck").click(function() {
		if($("#allListCheck").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked) $("#allListCheck").prop("checked", false);
		else $("#allListCheck").prop("checked", true); 
	});
	
	//타입 삭제
	$("#typeDelete").click(function() {
		var checked = $("input[name=chk]:checked").length;
		if(checked == 0){
			alert("삭제할 제품을 선택해주세요");
			return;
		}
		
		let chkVal = [];
		$("input:checkbox[name=chk]").each(function(index){
			if($(this).is(":checked")==true){
		    	chkVal.push($(this).val());
		    }
		});
		
		let obj = {idxList: chkVal.toString()};

		if(window.confirm(checked+"개의 제품을 삭제하시겠습니까?")){
			$.ajax({
		   	      type: "POST",
		   	      url: "typeDelete.do",
		   	      dataType:"json",
		   	      traditional:true,
		       	  data : {"idxList":chkVal},
		   	      success: function (data) {
		   	    	  alert("삭제되었습니다.");
		   	    	  location.href = "productRegists.do";
		   	      },
				error : function(){
					alert("에러가 발생했습니다.");		
				}
			});
		}

	});
	
	//두께 삭제
	$("#thicknessDelete").click(function() {
		var checked = $("input[name=chk]:checked").length;
		if(checked == 0){
			alert("삭제할 제품을 선택해주세요");
			return;
		}
		
		let chkVal = [];
		$("input:checkbox[name=chk]").each(function(index){
			if($(this).is(":checked")==true){
		    	chkVal.push($(this).val());
		    }
		});
		
		let obj = {idxList: chkVal.toString()};

		if(window.confirm(checked+"개의 제품을 삭제하시겠습니까?")){
			$.ajax({
		   	      type: "POST",
		   	      url: "thicknessDelete.do",
		   	      dataType:"json",
		   	      traditional:true,
		       	  data : {"idxList":chkVal},
		   	      success: function (data) {
		   	    	  alert("삭제되었습니다.");
		   	    	  location.href = "productThickness.do";
		   	      },
				error : function(){
					alert("에러가 발생했습니다.");		
				}
			});
		}

	});

	//사이즈 삭제
	$("#sizeDelete").click(function() {
		var checked = $("input[name=chk]:checked").length;
		if(checked == 0){
			alert("삭제할 제품을 선택해주세요");
			return;
		}
		
		let chkVal = [];
		$("input:checkbox[name=chk]").each(function(index){
			if($(this).is(":checked")==true){
		    	chkVal.push($(this).val());
		    }
		});
		
		let obj = {idxList: chkVal.toString()};

		if(window.confirm(checked+"개의 제품을 삭제하시겠습니까?")){
			$.ajax({
		   	      type: "POST",
		   	      url: "sizeDelete.do",
		   	      dataType:"json",
		   	      traditional:true,
		       	  data : {"idxList":chkVal},
		   	      success: function (data) {
		   	    	  alert("삭제되었습니다.");
		   	    	  location.href = "productSize.do";
		   	      },
				error : function(){
					alert("에러가 발생했습니다.");		
				}
			});
		}
	});
	
	//사이즈 삭제
	$("#detailDelete").click(function() {
		var checked = $("input[name=chk]:checked").length;
		if(checked == 0){
			alert("삭제할 제품을 선택해주세요");
			return;
		}
		
		let chkVal = [];
		$("input:checkbox[name=chk]").each(function(index){
			if($(this).is(":checked")==true){
		    	chkVal.push($(this).val());
		    }
		});
		
		let obj = {idxList: chkVal.toString()};

		if(window.confirm(checked+"개의 제품을 삭제하시겠습니까?")){
			$.ajax({
		   	      type: "POST",
		   	      url: "detailDelete.do",
		   	      dataType:"json",
		   	      traditional:true,
		       	  data : {"idxList":chkVal},
		   	      success: function (data) {
		   	    	  alert("삭제되었습니다.");
		   	    	  location.href = "productDetail.do";
		   	      },
				error : function(){
					alert("에러가 발생했습니다.");		
				}
			});
		}
	});
	
	//pdf 확장자 체크
	$("input:file[name='file1']").change(function () {
		console.log("file");
	    var str = $(this).val();
	    var size = $(this).size();
	    console.log(size);
	    var fileName = str.split('\\').pop().toLowerCase();
	    //alert(fileName);
	    var check = checkFileName(fileName);
	    if(!check){
	    	$("input:file[name='file1']").val('');
	    	$("input:text[name='filename']").val('');
	    	return;
	    }
	    
	    var maxSize = 10 * 1024 * 1024; // 10MB
	    var fileSize = $(this).prop('files')[0].size;
	    console.log(maxSize);
	    console.log(fileSize);
	    if(fileSize > maxSize){
	    	alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
	    	$("input:file[name='file1']").val('');
	    	$("input:text[name='filename']").val('');
	    	return;
	    }
	    
	});
	
})
