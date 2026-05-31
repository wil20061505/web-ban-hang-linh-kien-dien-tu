/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     5/31/2026 10:19:15 PM                        */
/*==============================================================*/


drop table if exists BAIVIET;

drop table if exists BAOCAOTHONGKE;

drop table if exists BINHLUAN;

drop table if exists BINHLUANSANPHAM;

drop table if exists CHITIETDONHANG;

drop table if exists CHITIETGIOHANG;

drop table if exists DANHGIA;

drop table if exists DANHMUC;

drop table if exists DONHANG;

drop table if exists GIOHANG;

drop table if exists HOSOKHACHHANG;

drop table if exists KHOHANG;

drop table if exists KHUYENMAI;

drop table if exists LICHSUKHO;

drop table if exists NGUOIDUNG;

drop table if exists NHATKYHETHONG;

drop table if exists SANPHAM;

drop table if exists THANHTOAN;

drop table if exists THONGBAO;

drop table if exists YEUCAUHOTRO;

/*==============================================================*/
/* Table: BAIVIET                                               */
/*==============================================================*/
create table BAIVIET
(
   BAIVIETID            int not null auto_increment,
   TIEUDE               varchar(255),
   NOIDUNG              text,
   NGAYDANG             datetime,
   primary key (BAIVIETID)
);

/*==============================================================*/
/* Table: BAOCAOTHONGKE                                         */
/*==============================================================*/
create table BAOCAOTHONGKE
(
   BAOCAOID             int not null auto_increment,
   NGUOIDUNGID          int,
   LOAIBAOCAO           varchar(50),
   TONGDOANHTHU         decimal(10,2),
   TONGDONHANG          int,
   TONGSANPHAMBAN       int,
   SOLUONGTONKHO        int,
   NGAYTAO              datetime,
   primary key (BAOCAOID)
);

/*==============================================================*/
/* Table: BINHLUAN                                              */
/*==============================================================*/
create table BINHLUAN
(
   BINHLUANID           int not null auto_increment,
   BAIVIETID            int,
   NGUOIDUNGID          int,
   NOIDUNG              text,
   NGAYDANG             datetime,
   primary key (BINHLUANID)
);

/*==============================================================*/
/* Table: BINHLUANSANPHAM                                       */
/*==============================================================*/
create table BINHLUANSANPHAM
(
   BINHLUANSANPHAMID    int not null auto_increment,
   NGUOIDUNGID          int,
   SANPHAMID            int,
   NOIDUNG              text,
   NGAYDANG             datetime,
   DAPHEDUYET           bool,
   primary key (BINHLUANSANPHAMID)
);

/*==============================================================*/
/* Table: CHITIETDONHANG                                        */
/*==============================================================*/
create table CHITIETDONHANG
(
   CHITIETDONHANGID     int not null auto_increment,
   DONHANGID            int,
   SANPHAMID            int,
   SOLUONG              int,
   GIALUCMUA            decimal(10,2),
   primary key (CHITIETDONHANGID)
);

/*==============================================================*/
/* Table: CHITIETGIOHANG                                        */
/*==============================================================*/
create table CHITIETGIOHANG
(
   CHITIETGIOHANGID     int not null auto_increment,
   GIOHANGID            int,
   SANPHAMID            int,
   SOLUONG              int,
   primary key (CHITIETGIOHANGID)
);

/*==============================================================*/
/* Table: DANHGIA                                               */
/*==============================================================*/
create table DANHGIA
(
   DANHGIAID            int not null auto_increment,
   NGUOIDUNGID          int,
   SANPHAMID            int,
   SOSAO                int,
   NOIDUNGDANHGIA       text,
   DAPHEDUYET           bool,
   primary key (DANHGIAID)
);

/*==============================================================*/
/* Table: DANHMUC                                               */
/*==============================================================*/
create table DANHMUC
(
   DANHMUCID            int not null auto_increment,
   TENDANHMUC           varchar(100),
   DUONGDANSLUG         varchar(100),
   primary key (DANHMUCID)
);

/*==============================================================*/
/* Table: DONHANG                                               */
/*==============================================================*/
create table DONHANG
(
   DONHANGID            int not null auto_increment,
   NGUOIDUNGID          int,
   KHUYENMAIID          int,
   TRANGTHAIDONHANG     varchar(50),
   DIACHIGIAOHANG       varchar(255),
   PHIVANCHUYEN         decimal(10,2),
   TONGTIENTHANHTOAN    decimal(10,2),
   NGAYTAO              datetime,
   primary key (DONHANGID)
);

/*==============================================================*/
/* Table: GIOHANG                                               */
/*==============================================================*/
create table GIOHANG
(
   GIOHANGID            int not null auto_increment,
   NGUOIDUNGID          int,
   TONGTIENTAMTINH      decimal(10,2),
   primary key (GIOHANGID)
);

/*==============================================================*/
/* Table: HOSOKHACHHANG                                         */
/*==============================================================*/
create table HOSOKHACHHANG
(
   HOSOID               int not null auto_increment,
   NGUOIDUNGID          int,
   HOTEN                varchar(100),
   SODIENTHOAI          varchar(15),
   DIACHIMACDINH        varchar(255),
   DIEMTICHLUY          int,
   primary key (HOSOID)
);

/*==============================================================*/
/* Table: KHOHANG                                               */
/*==============================================================*/
create table KHOHANG
(
   KHOHANGID            int not null auto_increment,
   SANPHAMID            int,
   SOLUONGTONKHO        int,
   NGUONGSAPHETHANG     int,
   primary key (KHOHANGID)
);

/*==============================================================*/
/* Table: KHUYENMAI                                             */
/*==============================================================*/
create table KHUYENMAI
(
   KHUYENMAIID          int not null auto_increment,
   MAGIAMGIA            varchar(50),
   GIATRIGIAM           decimal(10,2),
   NGAYHETHAN           datetime,
   primary key (KHUYENMAIID)
);

/*==============================================================*/
/* Table: LICHSUKHO                                             */
/*==============================================================*/
create table LICHSUKHO
(
   LICHSUID             int not null auto_increment,
   KHOHANGID            int,
   LOAIGIAODICH         varchar(255),
   SOLUONGTHAYDOI       int,
   NGAYTHUCHIEN         datetime,
   GHICHU               text,
   primary key (LICHSUID)
);

/*==============================================================*/
/* Table: NGUOIDUNG                                             */
/*==============================================================*/
create table NGUOIDUNG
(
   NGUOIDUNGID          int not null auto_increment,
   TENDANGNHAP          varchar(50),
   MATKHAUHASH          varchar(255),
   EMAIL                varchar(100),
   TRANGTHAIKICHHOAT    bool,
   ROLE                 varchar(20),
   primary key (NGUOIDUNGID)
);

/*==============================================================*/
/* Table: NHATKYHETHONG                                         */
/*==============================================================*/
create table NHATKYHETHONG
(
   NHATKYID             int not null auto_increment,
   NGUOIDUNGID          int,
   HANHDONG             varchar(255),
   THOIGIAN             datetime,
   primary key (NHATKYID)
);

/*==============================================================*/
/* Table: SANPHAM                                               */
/*==============================================================*/
create table SANPHAM
(
   SANPHAMID            int not null auto_increment,
   DANHMUCID            int,
   TENSANPHAM           varchar(255),
   THUONGHIEU           varchar(100),
   GIABAN               decimal(10,2),
   MOTA                 text,
   DUONGDANSLUG         varchar(100),
   primary key (SANPHAMID)
);

/*==============================================================*/
/* Table: THANHTOAN                                             */
/*==============================================================*/
create table THANHTOAN
(
   THANHTOANID          int not null auto_increment,
   DONHANGID            int,
   PHUONGTHUCTHANHTOAN  varchar(50),
   MAGIAODICHCONG       varchar(100),
   TRANGTHAITHANHTOAN   varchar(50),
   primary key (THANHTOANID)
);

/*==============================================================*/
/* Table: THONGBAO                                              */
/*==============================================================*/
create table THONGBAO
(
   THONGBAOID           int not null auto_increment,
   NGUOIDUNGID          int,
   DONHANGID            int,
   NOIDUNGTHONGBAO      varchar(255),
   DADOC                bool,
   NGAYTAO              datetime,
   primary key (THONGBAOID)
);

/*==============================================================*/
/* Table: YEUCAUHOTRO                                           */
/*==============================================================*/
create table YEUCAUHOTRO
(
   YEUCAUID             int not null auto_increment,
   NGUOIDUNGID          int,
   NOIDUNGYEUCAU        text,
   TRANGTHAIXULY        varchar(50),
   NGAYTAO              datetime,
   primary key (YEUCAUID)
);

alter table BAOCAOTHONGKE add constraint FK_REFERENCE_22 foreign key (NGUOIDUNGID)
      references NGUOIDUNG (NGUOIDUNGID);

alter table BINHLUAN add constraint FK_REFERENCE_16 foreign key (BAIVIETID)
      references BAIVIET (BAIVIETID);

alter table BINHLUAN add constraint FK_REFERENCE_17 foreign key (NGUOIDUNGID)
      references NGUOIDUNG (NGUOIDUNGID);

alter table BINHLUANSANPHAM add constraint FK_REFERENCE_23 foreign key (NGUOIDUNGID)
      references NGUOIDUNG (NGUOIDUNGID);

alter table BINHLUANSANPHAM add constraint FK_REFERENCE_24 foreign key (SANPHAMID)
      references SANPHAM (SANPHAMID);

alter table CHITIETDONHANG add constraint FK_REFERENCE_10 foreign key (DONHANGID)
      references DONHANG (DONHANGID);

alter table CHITIETDONHANG add constraint FK_REFERENCE_11 foreign key (SANPHAMID)
      references SANPHAM (SANPHAMID);

alter table CHITIETGIOHANG add constraint FK_REFERENCE_7 foreign key (GIOHANGID)
      references GIOHANG (GIOHANGID);

alter table CHITIETGIOHANG add constraint FK_REFERENCE_8 foreign key (SANPHAMID)
      references SANPHAM (SANPHAMID);

alter table DANHGIA add constraint FK_REFERENCE_13 foreign key (NGUOIDUNGID)
      references NGUOIDUNG (NGUOIDUNGID);

alter table DANHGIA add constraint FK_REFERENCE_14 foreign key (SANPHAMID)
      references SANPHAM (SANPHAMID);

alter table DONHANG add constraint FK_REFERENCE_19 foreign key (KHUYENMAIID)
      references KHUYENMAI (KHUYENMAIID);

alter table DONHANG add constraint FK_REFERENCE_9 foreign key (NGUOIDUNGID)
      references NGUOIDUNG (NGUOIDUNGID);

alter table GIOHANG add constraint FK_REFERENCE_6 foreign key (NGUOIDUNGID)
      references NGUOIDUNG (NGUOIDUNGID);

alter table HOSOKHACHHANG add constraint FK_REFERENCE_2 foreign key (NGUOIDUNGID)
      references NGUOIDUNG (NGUOIDUNGID);

alter table KHOHANG add constraint FK_REFERENCE_4 foreign key (SANPHAMID)
      references SANPHAM (SANPHAMID);

alter table LICHSUKHO add constraint FK_REFERENCE_5 foreign key (KHOHANGID)
      references KHOHANG (KHOHANGID);

alter table NHATKYHETHONG add constraint FK_REFERENCE_18 foreign key (NGUOIDUNGID)
      references NGUOIDUNG (NGUOIDUNGID);

alter table SANPHAM add constraint FK_REFERENCE_3 foreign key (DANHMUCID)
      references DANHMUC (DANHMUCID);

alter table THANHTOAN add constraint FK_REFERENCE_12 foreign key (DONHANGID)
      references DONHANG (DONHANGID);

alter table THONGBAO add constraint FK_REFERENCE_20 foreign key (NGUOIDUNGID)
      references NGUOIDUNG (NGUOIDUNGID);

alter table THONGBAO add constraint FK_REFERENCE_21 foreign key (DONHANGID)
      references DONHANG (DONHANGID);

alter table YEUCAUHOTRO add constraint FK_REFERENCE_15 foreign key (NGUOIDUNGID)
      references NGUOIDUNG (NGUOIDUNGID);

