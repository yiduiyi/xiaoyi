drop table if exists bill;

drop table if exists bill_record_r;

drop table if exists consultant;

drop table if exists teacher_consultant_r;

drop table if exists teacher_integral;

drop table if exists teacher_integral_sum;

drop table if exists teacher_resume;

drop table if exists teacher_resume_r;

drop table if exists teacher_space_set;
/*==============================================================*/
/* Table: bill                                                  */
/*==============================================================*/
create table bill
(
   bill_id              varchar(36) not null comment '派单主键',
   serial_number        varchar(36) comment '编号',
   grade_id             varchar(36) comment '年级主键',
   course_id            varchar(36) comment '科目主键',
   consultant_id        varchar(36) comment '课程顾问主键',
   class_time           datetime comment '上课时间',
   class_address        varchar(255) comment '上课地址',
   demand               text comment '上课要求',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   status               int(2) comment '状态（-1.已删除 0.初始状态 1.派单中 2.已派单）',
   primary key (bill_id)
);

alter table bill comment '派单表，记录所有的派单信息。';

/*==============================================================*/
/* Table: bill_record_r                                         */
/*==============================================================*/
create table bill_record_r
(
   bill_record_id       varchar(36) not null comment '派单记录主键',
   bill_id              varchar(36) comment '订单主键',
   teacherId            varchar(36) comment '教师主键',
   teacher_resume_r_id  varchar(36) not null comment '教师与简历绑定关系主键',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   status               int(2) comment '状态（-1.接单失败 0.面试中 1.接单成功）',
   primary key (bill_record_id)
);

alter table bill_record_r comment '派单记录表，记录老师投递的信息。';

/*==============================================================*/
/* Table: consultant                                            */
/*==============================================================*/
create table consultant
(
   consultant_id        varchar(36) not null comment '课程顾问主键',
   consultant_name      varchar(36) comment '课程顾问姓名',
   picId                varchar(36) comment '照片主键',
   telNumber            varchar(20) comment '电话号码',
   notes                varchar(500) comment '备注',
   openId               varchar(36) comment '微信唯一索引',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   status               int(2) comment '状态（-1.离职 0.正常 1.休假）',
   primary key (consultant_id)
);

alter table consultant comment '课程顾问表';

/*==============================================================*/
/* Table: teacher_consultant_r                                  */
/*==============================================================*/
create table teacher_consultant_r
(
   teacher_consultant_id varchar(36) not null comment '教师课程顾问绑定表',
   teacherId            varchar(36) comment '教师主键',
   consultant_id        varchar(36) comment '课程顾问主键',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   status               int(2) comment '状态(-1.解约 0.正常)',
   primary key (teacher_consultant_id)
);

alter table teacher_consultant_r comment '教师课程顾问绑定表';

/*==============================================================*/
/* Table: teacher_integral                                      */
/*==============================================================*/
create table teacher_integral
(
   teacher_integral_id  varchar(36) not null comment '教师积分表主键',
   teacherId            varchar(36) comment '教师主键',
   integral_num         float(6,2) comment '积分数量',
   operation_type       int(2) comment '操作类型（-1.扣除 0.新增）',
   operation_description varchar(36) comment '操作描述',
   create_time          datetime comment '创建时间',
   primary key (teacher_integral_id)
);

alter table teacher_integral comment '教师积分表';

/*==============================================================*/
/* Table: teacher_integral_sum                                  */
/*==============================================================*/
create table teacher_integral_sum
(
   teacherId            varchar(36) not null comment '积分总表主键(使用教师表主键)',
   integral_count       float(6,2) comment '积分总数',
   create_time          datetime comment '创建时间',
   status               int(2) comment '状态(-1.删除 0.正常)',
   primary key (teacherId)
);

alter table teacher_integral_sum comment '教师积分总表';

/*==============================================================*/
/* Table: teacher_resume                                        */
/*==============================================================*/
create table teacher_resume
(
   teacher_resume_id    varchar(36) not null comment '教师接单设置主键',
   taught_subject       varchar(255) comment '可任教科目',
   introduce            text comment '教师自我介绍',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   status               int(2) comment '状态（-1.删除 0.正常）',
   primary key (teacher_resume_id)
);

alter table teacher_resume comment '教师简历表';

/*==============================================================*/
/* Table: teacher_resume_r                                      */
/*==============================================================*/
create table teacher_resume_r
(
   teacher_resume_r_id  varchar(36) not null comment '教师与简历绑定关系主键',
   teacherId            varchar(36) comment '教师主键',
   teacher_resume_id    varchar(36) comment '简历主键',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   is_default           int(2) comment '是否默认(0.普通 1.默认)',
   status               int(2) comment '状态（-1.删除 0.正常）',
   primary key (teacher_resume_r_id)
);

alter table teacher_resume_r comment '教师简历绑定表';

/*==============================================================*/
/* Table: teacher_space_set                                     */
/*==============================================================*/
create table teacher_space_set
(
   teacher_space_set_id varchar(36) not null comment '教师设置表主键',
   teacherId            national varchar(36) not null comment 'teacherId',
   is_remind            int(2) comment '是否接收生源提醒(0.不接收 1.接收)',
   create_time          datetime comment '创建时间',
   update_time          datetime comment '更新时间',
   status               int(2) comment '状态(1.删除 0.正常)',
   primary key (teacher_space_set_id)
);

alter table teacher_space_set comment '老师空间设置表';

ALTER TABLE teacher add  standby_tel_number varchar(36) comment '备用电话';

