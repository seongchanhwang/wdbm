package com.springbook.etc.vo;

import java.util.Date;
import lombok.Data;

@Data
public class ProductDetailVO {
	private int detailIdx;
	private Date regDate;
	private String productCd;
	private String thickness;
	private String size;
	private String safety;
	private String pallet;
	private String slice;
	private int stock;
}
