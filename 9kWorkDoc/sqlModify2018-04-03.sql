ALTER TABLE `tbl_case_book` MODIFY COLUMN `UPLOADER_ID`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传者ID' AFTER `RECORD_ID`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `UPLOADER`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传者' AFTER `UPLOADER_ID`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `UPLOADER_TYPE`  tinyint(4) UNSIGNED NULL DEFAULT NULL COMMENT '上传者类型:医生-1 患者-2' AFTER `UPLOADER`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `ORDER_NO`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号' AFTER `UPLOADER_TYPE`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `IS_DELETE`  tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '是否删除，默认否 否-0 是-1' AFTER `ORDER_NO`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `IS_PUBLIC`  tinyint(4) UNSIGNED NULL DEFAULT 1 COMMENT '是否公开，默认公开 否-0 是-1' AFTER `IS_DELETE`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `IS_INTERIM`  tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '是否临时，默认否 否-0 是-1  9K医生-2' AFTER `IS_PUBLIC`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `STATUS`  tinyint(4) UNSIGNED NULL DEFAULT 1 COMMENT '是否有效：无效-0 有效-1' AFTER `IS_INTERIM`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `PATIENT_NAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就诊人' AFTER `STATUS`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `SEX`  tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '性别 男-0 女-1' AFTER `PATIENT_NAME`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `AGE`  tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '年龄' AFTER `SEX`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `IMAGE`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像' AFTER `AGE`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `SYMPTOM`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '病症描述' AFTER `IMAGE`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `VISIT_TIME`  date NULL DEFAULT NULL COMMENT '线下就诊日期' AFTER `SYMPTOM`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `HOSPITAL_NAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '线下就诊医院名称' AFTER `VISIT_TIME`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `DEPT_CODE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线下就诊科室编号' AFTER `HOSPITAL_NAME`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `DEPT_NAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线下就诊科室名称' AFTER `DEPT_CODE`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `DOCTOR_CODE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线下就诊医生标识' AFTER `DEPT_NAME`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `DOCTOR_NAME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线下接诊医生' AFTER `DOCTOR_CODE`;
ALTER TABLE `tbl_case_book` ADD COLUMN `TITLE_NAME`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称名称' AFTER `DOCTOR_NAME`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `CONSULT_DATE`  date NULL DEFAULT NULL COMMENT '9K咨询日期' AFTER `TITLE_NAME`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `CONSULT_DOCTOR_CODE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '9k医生标识' AFTER `CONSULT_DATE`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `CONSULT_DOCTOR_NAME`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '9K咨询专家' AFTER `CONSULT_DOCTOR_CODE`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `CONSULT_DOCTOR_HOSPITAL_NAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '9K咨询专家所在医院名称' AFTER `CONSULT_DOCTOR_NAME`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `CONSULT_DOCTOR_DEPT_NAME`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '9K咨询专家所在科室名称' AFTER `CONSULT_DOCTOR_HOSPITAL_NAME`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `CONSULT_DOCTOR_LEVEL_NAME`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '9K咨询专家职称' AFTER `CONSULT_DOCTOR_DEPT_NAME`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `DIAGNOSE`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '(确诊病症)线下诊断' AFTER `CONSULT_DOCTOR_LEVEL_NAME`;
ALTER TABLE `tbl_case_book` ADD COLUMN `SICKTIMES`  tinyint(4) NULL DEFAULT NULL COMMENT '时长：0：未知 1：一周 2：一周至一个月 3：一个月至三个月 4： 三个月至半年 5：半年以上' AFTER `DIAGNOSE`;
ALTER TABLE `tbl_case_book` ADD COLUMN `IS_TO_HOSPITAL`  tinyint(4) NULL DEFAULT NULL COMMENT '是否去医院 0否 1是' AFTER `SICKTIMES`;
ALTER TABLE `tbl_case_book` ADD COLUMN `IS_DIAGNOSE`  tinyint(4) NULL DEFAULT NULL AFTER `IS_TO_HOSPITAL`;
ALTER TABLE `tbl_case_book` MODIFY COLUMN `UPDATE_TIME`  datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' AFTER `IS_DIAGNOSE`;

CREATE TABLE `tbl_doctor_server` (
`ID`  int(20) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`DOCTOR_ID`  int(20) UNSIGNED NOT NULL COMMENT '医生主键' ,
`SERVICE_PACKAGE_CODE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐包CODE' ,
`SERVE_CODE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务CODE' ,
`CAN_OPEN`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '能否开通（由管理端控制）：否-0 是-1' ,
`IS_OPEN`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否开通（由用户控制）：否-0 是-1' ,
`IS_SEND`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否发送短信0未发送1已发送' ,
`CREATE_TIME`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`UPDATE_TIME`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`ID`),
UNIQUE INDEX `UNIQ_DOCTOR_ID_PACKAGE_CODE` (`DOCTOR_ID`, `SERVICE_PACKAGE_CODE`) USING BTREE
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;

ALTER TABLE `tbl_hongbao` DROP COLUMN `short_title`;

ALTER TABLE `tbl_hongbao_record` MODIFY COLUMN `nickname`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '领取人昵称' AFTER `avatar`;
ALTER TABLE `tbl_hongbao_record` ADD COLUMN `share_openid`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分享人  openid' AFTER `amount`;

CREATE TABLE `tbl_im_file_record` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`im_file_date`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名日期' ,
`file_status`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件状态' ,
`parse_status`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '解析状态' ,
`create_time`  datetime NOT NULL COMMENT '创建日期' ,
`update_time`  datetime NOT NULL COMMENT '更新日期' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Dynamic
;

ALTER TABLE `tbl_member_record` ADD COLUMN `CONTACT_MOBILE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机号' AFTER `UPDATE_TIME`;

ALTER TABLE `tbl_member_record_apply` MODIFY COLUMN `AUTH_STATUS`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '审核状态：未添加-0审核中-1 审核成功-2 审核失败-3' AFTER `IS_FAMILYMEMBER`;

CREATE TABLE `tbl_serve` (
`ID`  int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '服务主键' ,
`CODE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`NAME`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务名称' ,
`TYPE`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '种类（10视频  20图文 30电话）' ,
`IS_FC`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否义诊：0否1是' ,
`IS_RECOMMEND`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否推荐：0否1是' ,
`SORT`  int(4) NOT NULL ,
`REMARK`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注' ,
`REMARK_VIP`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`DETAIL`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细信息' ,
`DETAIL_VIP`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'VIP详细信息' ,
`CREATE_TIME`  datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
`UPDATE_TIME`  datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' ,
PRIMARY KEY (`ID`),
UNIQUE INDEX `UNIQ_CODE` (`CODE`) USING BTREE
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;

ALTER TABLE `tbl_service_package` MODIFY COLUMN `NAME`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务套餐名称' AFTER `CODE`;
ALTER TABLE `tbl_service_package` ADD COLUMN `SERVE_CODE`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务CODE' AFTER `NAME`;
ALTER TABLE `tbl_service_package` MODIFY COLUMN `RANK_CODE`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '医生等级Code' AFTER `SERVE_CODE`;
ALTER TABLE `tbl_service_package` MODIFY COLUMN `PACKAGE_PRICE`  decimal(18,2) NULL DEFAULT NULL COMMENT '套餐价格' AFTER `RANK_CODE`;
ALTER TABLE `tbl_service_package` ADD COLUMN `PACKAGE_ORIGINAL_PRICE`  decimal(18,2) NULL DEFAULT NULL COMMENT '套餐原始价格' AFTER `PACKAGE_PRICE`;
ALTER TABLE `tbl_service_package` MODIFY COLUMN `PACKAGE_UNIT_PRICE`  decimal(18,2) NULL DEFAULT NULL COMMENT '套餐单价' AFTER `PACKAGE_ORIGINAL_PRICE`;
ALTER TABLE `tbl_service_package` MODIFY COLUMN `IM_DURATION`  int(20) NULL DEFAULT NULL COMMENT 'IM 图文时长 (天)' AFTER `PACKAGE_DURATION`;
ALTER TABLE `tbl_service_package` ADD COLUMN `PACKAGE_PRICE_VIP`  decimal(18,2) NULL DEFAULT NULL COMMENT '套餐价格VIP' AFTER `IM_DURATION`;
ALTER TABLE `tbl_service_package` ADD COLUMN `PACKAGE_UNIT_PRICE_VIP`  decimal(18,2) NULL DEFAULT NULL COMMENT '套餐单价VIP' AFTER `PACKAGE_PRICE_VIP`;
ALTER TABLE `tbl_service_package` ADD COLUMN `PACKAGE_DURATION_VIP`  int(20) NULL DEFAULT NULL COMMENT '套餐时长(分钟)VIP' AFTER `PACKAGE_UNIT_PRICE_VIP`;
ALTER TABLE `tbl_service_package` ADD COLUMN `IM_DURATION_VIP`  int(20) NULL DEFAULT NULL COMMENT 'IM 图文时长 (天)VIP' AFTER `PACKAGE_DURATION_VIP`;
ALTER TABLE `tbl_service_package` DROP COLUMN `PACKAGE_DISCOUNT_RATE`;
ALTER TABLE `tbl_service_package` DROP COLUMN `PACKAGE_RENEW_PRICE`;
CREATE UNIQUE INDEX `UNIQ_SERVE_CODE_RANK_CODE` ON `tbl_service_package`(`SERVE_CODE`, `RANK_CODE`) USING BTREE ;

INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('1', '1001', '视频套餐10分钟', '12', '101', '39.00', '119.00', '0.00', '10', '5', '35.00', '0.00', '10', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('2', '1002', '视频套餐10分钟', '12', '102', '99.00', '299.00', '0.00', '10', '5', '89.00', '0.00', '10', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('3', '1003', '视频套餐10分钟', '12', '103', '159.00', '399.00', '0.00', '10', '5', '143.00', '0.00', '10', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('4', '1004', '视频套餐10分钟', '12', '104', '199.00', '499.00', '0.00', '10', '5', '179.00', '0.00', '10', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('5', '1005', '视频套餐10分钟', '12', '105', '249.00', '599.00', '0.00', '10', '5', '224.00', '0.00', '10', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('6', '1006', '视频套餐10分钟', '12', '106', '319.00', '799.00', '0.00', '10', '5', '287.00', '0.00', '10', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('7', '1007', '视频套餐10分钟', '12', '107', '399.00', '1080.00', '0.00', '10', '5', '359.00', '0.00', '10', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('8', '1008', '视频套餐10分钟', '12', '108', '499.00', '1480.00', '0.00', '10', '5', '449.00', '0.00', '10', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('9', '1009', '视频套餐10分钟', '12', '109', '669.00', '1980.00', '0.00', '10', '5', '602.00', '0.00', '10', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('10', '1010', '视频套餐10分钟', '12', '110', '769.00', '2480.00', '0.00', '10', '5', '692.00', '0.00', '10', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('11', '1011', '视频套餐15分钟', '13', '101', '49.00', '159.00', '0.00', '15', '5', '44.00', '0.00', '15', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('12', '1012', '视频套餐15分钟', '13', '102', '129.00', '399.00', '0.00', '15', '5', '116.00', '0.00', '15', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('13', '1013', '视频套餐15分钟', '13', '103', '209.00', '499.00', '0.00', '15', '5', '188.00', '0.00', '15', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('14', '1014', '视频套餐15分钟', '13', '104', '249.00', '599.00', '0.00', '15', '5', '224.00', '0.00', '15', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('15', '1015', '视频套餐15分钟', '13', '105', '319.00', '799.00', '0.00', '15', '5', '287.00', '0.00', '15', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('16', '1016', '视频套餐15分钟', '13', '106', '399.00', '1080.00', '0.00', '15', '5', '359.00', '0.00', '15', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('17', '1017', '视频套餐15分钟', '13', '107', '499.00', '1480.00', '0.00', '15', '5', '449.00', '0.00', '15', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('18', '1018', '视频套餐15分钟', '13', '108', '699.00', '1980.00', '0.00', '15', '5', '629.00', '0.00', '15', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('19', '1019', '视频套餐15分钟', '13', '109', '899.00', '2480.00', '0.00', '15', '5', '809.00', '0.00', '15', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('20', '1020', '视频套餐15分钟', '13', '110', '999.00', '2980.00', '0.00', '15', '5', '899.00', '0.00', '15', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('21', '1021', '视频套餐5分钟', '11', '101', '9.00', '59.00', '0.00', '5', '2', '8.00', '0.00', '5', '4', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('22', '1022', '视频套餐5分钟', '11', '102', '29.00', '149.00', '0.00', '5', '2', '26.00', '0.00', '5', '4', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('23', '1023', '视频套餐5分钟', '11', '103', '39.00', '199.00', '0.00', '5', '2', '35.00', '0.00', '5', '4', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('24', '1024', '视频套餐5分钟', '11', '104', '49.00', '249.00', '0.00', '5', '2', '44.00', '0.00', '5', '4', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('25', '1025', '视频套餐5分钟', '11', '105', '59.00', '299.00', '0.00', '5', '2', '53.00', '0.00', '5', '4', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('26', '1026', '视频套餐5分钟', '11', '106', '79.00', '399.00', '0.00', '5', '2', '71.00', '0.00', '5', '4', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('27', '1027', '视频套餐5分钟', '11', '107', '99.00', '499.00', '0.00', '5', '2', '89.00', '0.00', '5', '4', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('28', '1028', '视频套餐5分钟', '11', '108', '119.00', '699.00', '0.00', '5', '2', '107.00', '0.00', '5', '4', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('29', '1029', '视频套餐5分钟', '11', '109', '159.00', '799.00', '0.00', '5', '2', '143.00', '0.00', '5', '4', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('30', '1030', '视频套餐5分钟', '11', '110', '199.00', '999.00', '0.00', '5', '2', '179.00', '0.00', '5', '4', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('31', '1031', '图文不限次', '21', '101', '9.00', '19.00', '0.00', '0', '5', '8.00', '0.00', '0', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('32', '1032', '图文不限次', '21', '102', '19.00', '39.00', '0.00', '0', '5', '17.00', '0.00', '0', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('33', '1033', '图文不限次', '21', '103', '29.00', '59.00', '0.00', '0', '5', '26.00', '0.00', '0', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('34', '1034', '图文不限次', '21', '104', '39.00', '79.00', '0.00', '0', '5', '35.00', '0.00', '0', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('35', '1035', '图文不限次', '21', '105', '49.00', '99.00', '0.00', '0', '5', '44.00', '0.00', '0', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('36', '1036', '图文不限次', '21', '106', '69.00', '149.00', '0.00', '0', '5', '62.00', '0.00', '0', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('37', '1037', '图文不限次', '21', '107', '89.00', '199.00', '0.00', '0', '5', '80.00', '0.00', '0', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('38', '1038', '图文不限次', '21', '108', '119.00', '249.00', '0.00', '0', '5', '107.00', '0.00', '0', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('39', '1039', '图文不限次', '21', '109', '159.00', '319.00', '0.00', '0', '5', '143.00', '0.00', '0', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');
INSERT INTO `tbl_service_package` (`ID`, `CODE`, `NAME`, `SERVE_CODE`, `RANK_CODE`, `PACKAGE_PRICE`, `PACKAGE_ORIGINAL_PRICE`, `PACKAGE_UNIT_PRICE`, `PACKAGE_DURATION`, `IM_DURATION`, `PACKAGE_PRICE_VIP`, `PACKAGE_UNIT_PRICE_VIP`, `PACKAGE_DURATION_VIP`, `IM_DURATION_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('40', '1040', '图文不限次', '21', '110', '199.00', '399.00', '0.00', '0', '5', '179.00', '0.00', '0', '7', '2018-03-14 14:36:00', '2018-03-14 14:36:00');

INSERT INTO `tbl_serve` (`ID`, `CODE`, `NAME`, `TYPE`, `IS_FC`, `IS_RECOMMEND`, `SORT`, `REMARK`, `REMARK_VIP`, `DETAIL`, `DETAIL_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('1', '11', '视频5分钟', '10', '1', '0', '1', '每天可享1次', '每天可享1次', '[{\"typeCode\":\"10\",\"typeName\":\"视频\",\"itemDesc\":\"与我面对面视频咨询\",\"qtyDesc\":\"5分钟\"},{\"typeCode\":\"11\",\"typeName\":\"图文\",\"itemDesc\":\"图文咨询（我看到立即回复）\",\"qtyDesc\":\"3天\"},{\"typeCode\":\"12\",\"typeName\":\"病历\",\"itemDesc\":\"首诊医生帮您上传病历\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"13\",\"typeName\":\"会诊\",\"itemDesc\":\"首诊医生为您沟通病情\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"14\",\"typeName\":\"分析\",\"itemDesc\":\"报告解读或病历分析\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"15\",\"typeName\":\"建议\",\"itemDesc\":\"提供诊断建议或治疗方案\",\"qtyDesc\":\"1次\"}]', '[{\"typeCode\":\"10\",\"typeName\":\"视频\",\"itemDesc\":\"与我面对面视频咨询\",\"qtyDesc\":\"5分钟(VIP)\"},{\"typeCode\":\"11\",\"typeName\":\"图文\",\"itemDesc\":\"图文咨询（我看到立即回复）\",\"qtyDesc\":\"3天(VIP)\"},{\"typeCode\":\"12\",\"typeName\":\"病历\",\"itemDesc\":\"首诊医生帮您上传病历\",\"qtyDesc\":\"1次(VIP)\"},{\"typeCode\":\"13\",\"typeName\":\"会诊\",\"itemDesc\":\"首诊医生为您沟通病情\",\"qtyDesc\":\"1次(VIP)\"},{\"typeCode\":\"14\",\"typeName\":\"分析\",\"itemDesc\":\"报告解读或病历分析\",\"qtyDesc\":\"1次(VIP)\"},{\"typeCode\":\"15\",\"typeName\":\"建议\",\"itemDesc\":\"提供诊断建议或治疗方案\",\"qtyDesc\":\"1次(VIP)\"}]', '2017-05-18 14:56:54', '2017-05-18 14:56:57');
INSERT INTO `tbl_serve` (`ID`, `CODE`, `NAME`, `TYPE`, `IS_FC`, `IS_RECOMMEND`, `SORT`, `REMARK`, `REMARK_VIP`, `DETAIL`, `DETAIL_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('2', '12', '视频10分钟', '10', '0', '1', '2', '赠送图文咨询了2天', '赠送图文咨询4天', '[{\"typeCode\":\"10\",\"typeName\":\"视频\",\"itemDesc\":\"与我面对面视频咨询\",\"qtyDesc\":\"10分钟\"},{\"typeCode\":\"11\",\"typeName\":\"图文\",\"itemDesc\":\"图文咨询（我看到立即回复）\",\"qtyDesc\":\"2天\"},{\"typeCode\":\"12\",\"typeName\":\"病历\",\"itemDesc\":\"首诊医生帮您上传病历\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"13\",\"typeName\":\"会诊\",\"itemDesc\":\"首诊医生为您沟通病情\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"14\",\"typeName\":\"分析\",\"itemDesc\":\"报告解读或病历分析\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"15\",\"typeName\":\"建议\",\"itemDesc\":\"提供诊断建议或治疗方案\",\"qtyDesc\":\"1次\"}]', '[{\"typeCode\":\"10\",\"typeName\":\"视频\",\"itemDesc\":\"与我面对面视频咨询\",\"qtyDesc\":\"10分钟(VIP)\"},{\"typeCode\":\"11\",\"typeName\":\"图文\",\"itemDesc\":\"图文咨询（我看到立即回复）\",\"qtyDesc\":\"4天(VIP)\"},{\"typeCode\":\"12\",\"typeName\":\"病历\",\"itemDesc\":\"首诊医生帮您上传病历\",\"qtyDesc\":\"1次(VIP)\"},{\"typeCode\":\"13\",\"typeName\":\"会诊\",\"itemDesc\":\"首诊医生为您沟通病情\",\"qtyDesc\":\"1次(VIP)\"},{\"typeCode\":\"14\",\"typeName\":\"分析\",\"itemDesc\":\"报告解读或病历分析\",\"qtyDesc\":\"1次(VIP)\"},{\"typeCode\":\"15\",\"typeName\":\"建议\",\"itemDesc\":\"提供诊断建议或治疗方案\",\"qtyDesc\":\"1次(VIP)\"},{\"typeCode\":\"16\",\"typeName\":\"医生\",\"itemDesc\":\"优先安排专家\",\"qtyDesc\":\"24小时(VIP)\"},{\"typeCode\":\"17\",\"typeName\":\"档案\",\"itemDesc\":\"建立个人电子健康档案\",\"qtyDesc\":\"永久(VIP)\"},{\"typeCode\":\"18\",\"typeName\":\"客服\",\"itemDesc\":\"专属客服提供7*14服务\",\"qtyDesc\":\"早8点至晚10点(VIP)\"}]', '2017-05-18 14:57:27', '2017-05-18 14:57:29');
INSERT INTO `tbl_serve` (`ID`, `CODE`, `NAME`, `TYPE`, `IS_FC`, `IS_RECOMMEND`, `SORT`, `REMARK`, `REMARK_VIP`, `DETAIL`, `DETAIL_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('3', '13', '视频15分钟', '10', '0', '0', '3', '赠送图文咨询了3天', '赠送图文咨询5天 ', '[{\"typeCode\":\"10\",\"typeName\":\"视频\",\"itemDesc\":\"与我面对面视频咨询\",\"qtyDesc\":\"15分钟\"},{\"typeCode\":\"11\",\"typeName\":\"图文\",\"itemDesc\":\"图文咨询（我看到立即回复）\",\"qtyDesc\":\"3天\"},{\"typeCode\":\"12\",\"typeName\":\"病历\",\"itemDesc\":\"首诊医生帮您上传病历\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"13\",\"typeName\":\"会诊\",\"itemDesc\":\"首诊医生为您沟通病情\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"14\",\"typeName\":\"分析\",\"itemDesc\":\"报告解读或病历分析\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"15\",\"typeName\":\"建议\",\"itemDesc\":\"提供诊断建议或治疗方案\",\"qtyDesc\":\"1次\"}]', '[{\"typeCode\":\"10\",\"typeName\":\"视频\",\"itemDesc\":\"与我面对面视频咨询\",\"qtyDesc\":\"15分钟(VIP)\"},{\"typeCode\":\"11\",\"typeName\":\"图文\",\"itemDesc\":\"图文咨询（我看到立即回复）\",\"qtyDesc\":\"5天(VIP)\"},{\"typeCode\":\"12\",\"typeName\":\"病历\",\"itemDesc\":\"首诊医生帮您上传病历\",\"qtyDesc\":\"1次(VIP)\"},{\"typeCode\":\"13\",\"typeName\":\"会诊\",\"itemDesc\":\"首诊医生为您沟通病情\",\"qtyDesc\":\"1次(VIP)\"},{\"typeCode\":\"14\",\"typeName\":\"分析\",\"itemDesc\":\"报告解读或病历分析\",\"qtyDesc\":\"1次(VIP)\"},{\"typeCode\":\"15\",\"typeName\":\"建议\",\"itemDesc\":\"提供诊断建议或治疗方案\",\"qtyDesc\":\"1次(VIP)\"},{\"typeCode\":\"16\",\"typeName\":\"医生\",\"itemDesc\":\"优先安排专家\",\"qtyDesc\":\"24小时(VIP)\"},{\"typeCode\":\"17\",\"typeName\":\"档案\",\"itemDesc\":\"建立个人电子健康档案\",\"qtyDesc\":\"永久(VIP)\"},{\"typeCode\":\"18\",\"typeName\":\"客服\",\"itemDesc\":\"专属客服提供7*14服务\",\"qtyDesc\":\"早8点至晚10点(VIP)\"}]', '2017-05-18 14:57:31', '2017-05-18 14:57:34');
INSERT INTO `tbl_serve` (`ID`, `CODE`, `NAME`, `TYPE`, `IS_FC`, `IS_RECOMMEND`, `SORT`, `REMARK`, `REMARK_VIP`, `DETAIL`, `DETAIL_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('4', '21', '图文咨询', '20', '0', '0', '4', '5天内交流不限次', '7天内交流不限次', '[{\"typeCode\":\"10\",\"typeName\":\"图文\",\"itemDesc\":\"图文咨询（我看到立即回复）\",\"qtyDesc\":\"5天\"},{\"typeCode\":\"11\",\"typeName\":\"病历\",\"itemDesc\":\"首诊医生帮您上传病历\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"12\",\"typeName\":\"会诊\",\"itemDesc\":\"首诊医生为您沟通病情\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"13\",\"typeName\":\"分析\",\"itemDesc\":\"报告解读或病历分析\",\"qtyDesc\":\"1次\"},{\"typeCode\":\"14\",\"typeName\":\"建议\",\"itemDesc\":\"提供诊断建议或治疗方案\",\"qtyDesc\":\"1次\"}]', '[{\"10\":\"11\",\"图文\":\"病历\",\"图文咨询（我看到立即回复）\":\"首诊医生帮您上传病历\",\"7天(VIP)\":\"1次(VIP)\"},{\"10\":\"12\",\"图文\":\"会诊\",\"图文咨询（我看到立即回复）\":\"首诊医生为您沟通病情\",\"7天(VIP)\":\"1次(VIP)\"},{\"10\":\"13\",\"图文\":\"分析\",\"图文咨询（我看到立即回复）\":\"报告解读或病历分析\",\"7天(VIP)\":\"1次(VIP)\"},{\"10\":\"14\",\"图文\":\"建议\",\"图文咨询（我看到立即回复）\":\"提供诊断建议或治疗方案\",\"7天(VIP)\":\"1次(VIP)\"},{\"10\":\"15\",\"图文\":\"档案\",\"图文咨询（我看到立即回复）\":\"建立个人电子健康档案\",\"7天(VIP)\":\"永久(VIP)\"},{\"10\":\"16\",\"图文\":\"客服\",\"图文咨询（我看到立即回复）\":\"专属客服提供7*14服务\",\"7天(VIP)\":\"早8点至晚10点(VIP)\"}]', '2017-10-20 16:29:52', '2017-10-20 16:29:53');
INSERT INTO `tbl_serve` (`ID`, `CODE`, `NAME`, `TYPE`, `IS_FC`, `IS_RECOMMEND`, `SORT`, `REMARK`, `REMARK_VIP`, `DETAIL`, `DETAIL_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('5', '14', '固定会诊', '10', '0', '0', '5', '', NULL, NULL, NULL, '2017-10-20 16:29:52', '2017-10-20 16:29:53');
INSERT INTO `tbl_serve` (`ID`, `CODE`, `NAME`, `TYPE`, `IS_FC`, `IS_RECOMMEND`, `SORT`, `REMARK`, `REMARK_VIP`, `DETAIL`, `DETAIL_VIP`, `CREATE_TIME`, `UPDATE_TIME`) VALUES ('6', '31', '电话咨询', '30', '0', '0', '6', '', NULL, NULL, NULL, '2017-10-20 16:29:52', '2017-10-20 16:29:52');

#初始化医生服务表的义诊数据
INSERT INTO `tbl_doctor_server` (
	`DOCTOR_ID`,
	`SERVICE_PACKAGE_CODE`,
	`SERVE_CODE`,
	`CAN_OPEN`,
	`IS_OPEN`,
	`IS_SEND`
) SELECT
	tds.DOCTOR_ID,
	tsp.`CODE`,
	tsp.SERVE_CODE,
	TRUE,
	tds.IS_OPEN,
	tds.IS_SEND
FROM
	tbl_doctor_servers tds
LEFT JOIN tbl_doctor td ON (tds.DOCTOR_ID = td.ID)
LEFT JOIN tbl_service_package tsp ON (
	tsp.RANK_CODE = td.RANK_CODE
	AND tsp.SERVE_CODE = 11
)
WHERE
	tds.SERVETYPE = '02'
AND NOT ISNULL(tsp.`CODE`)
GROUP BY
	tds.DOCTOR_ID

#初始化医生服务表的视频数据
#视频10分钟
INSERT INTO `tbl_doctor_server` (
	`DOCTOR_ID`,
	`SERVICE_PACKAGE_CODE`,
	`SERVE_CODE`,
	`CAN_OPEN`,
	`IS_OPEN`,
	`IS_SEND`
) SELECT
	tds.DOCTOR_ID,
	tsp.`CODE`,
	tsp.SERVE_CODE,
	TRUE,
	tds.IS_OPEN,
	tds.IS_SEND
FROM
	tbl_doctor_servers tds
LEFT JOIN tbl_doctor td ON (tds.DOCTOR_ID = td.ID)
LEFT JOIN tbl_service_package tsp ON (
	tsp.RANK_CODE = td.RANK_CODE
	AND tsp.SERVE_CODE = 12
)
WHERE
	tds.SERVETYPE = '00'
AND NOT ISNULL(tsp.`CODE`)
GROUP BY
	tds.DOCTOR_ID

#视频15分钟
INSERT INTO `tbl_doctor_server` (
	`DOCTOR_ID`,
	`SERVICE_PACKAGE_CODE`,
	`SERVE_CODE`,
	`CAN_OPEN`,
	`IS_OPEN`,
	`IS_SEND`
) SELECT
	tds.DOCTOR_ID,
	tsp.`CODE`,
	tsp.SERVE_CODE,
	TRUE,
	tds.IS_OPEN,
	tds.IS_SEND
FROM
	tbl_doctor_servers tds
LEFT JOIN tbl_doctor td ON (tds.DOCTOR_ID = td.ID)
LEFT JOIN tbl_service_package tsp ON (
	tsp.RANK_CODE = td.RANK_CODE
	AND tsp.SERVE_CODE = 13
)
WHERE
	tds.SERVETYPE = '00'
AND NOT ISNULL(tsp.`CODE`)
GROUP BY
	tds.DOCTOR_ID
