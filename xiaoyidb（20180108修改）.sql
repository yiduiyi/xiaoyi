drop table if exists Account;

drop table if exists Class;

drop table if exists Grade;

drop table if exists LessonTrade;

drop table if exists LessonTradeSum;

drop table if exists LessonType;

drop table if exists OrderSum;

drop table if exists Order_Teaching_R;

drop table if exists Orders;

drop table if exists Parent_Stu_R;

drop table if exists Parents;

drop table if exists Picture;

drop table if exists Schedule;

drop table if exists School;

drop table if exists Student;

drop table if exists Suggestions;

drop table if exists Teacher;

drop table if exists Teacher_Les_R;

drop table if exists TeachingRecord;

drop table if exists User;

/*==============================================================*/
/* Table: Account                                               */
/*==============================================================*/
create table Account
(
   accountId            varchar(36) not null,
   teacherId            varchar(36),
   accountType          tinyint(3) comment '支付宝、微信等
            暂定（支付宝：0，微信：1）',
   accountNumber        varchar(36),
   status               tinyint(2) comment '0:正常，1：冻结',
   totalIncome          int,
   primary key (accountId)
);

alter table Account comment '账户表';

/*==============================================================*/
/* Table: Class                                                 */
/*==============================================================*/
create table Class
(
   classID              varchar(36) not null,
   gradeId              varchar(36) not null,
   schoolId             varchar(36) not null,
   className            varchar(36),
   primary key (classID, gradeId, schoolId)
);

/*==============================================================*/
/* Table: Grade                                                 */
/*==============================================================*/
create table Grade
(
   gradeId              varchar(36) not null,
   schoolId             varchar(36) not null,
   gradeName            varchar(36),
   primary key (gradeId, schoolId)
);

alter table Grade comment '年级表';

/*==============================================================*/
/* Table: LessonTrade                                           */
/*==============================================================*/
create table LessonTrade
(
   lessonTradeId        varchar(36) not null,
   lessonType           int,
   teacherId            varchar(36),
   memberId             varchar(36),
   parentId             varchar(36),
   notes                varchar(50),
   status               tinyint(2) comment '-1：提现失败
            1：已提交，待家长确认
            2：提现成功
            ',
   applyLessons         float,
   feedback             varchar(500),
   applyTime            datetime,
   primary key (lessonTradeId)
);

alter table LessonTrade comment '课时管理（提现交易）表';

/*==============================================================*/
/* Table: LessonTradeSum                                        */
/*==============================================================*/
create table LessonTradeSum
(
   teacherId            varchar(36) not null,
   checkedLessonNum     smallint comment '实际到帐课时，为老师提现实际到帐的课时和',
   withDrawLessonNum    smallint comment '老师申请提现通过的所有课时和',
   frozenLessonNum      smallint comment ' 冻结：指教员违约违规，需冻结老师课时费，老师不可提取冻结课时费。如教员又教初中又教高中，则优先冻结较高年级的课时，即冻结高中课时
            实际到帐课时=申请提现通过课时 — 累计冻结课时',
   totalLessonNum       float comment '历史所有课时数总和（评级标准之一）',
   totalIncome          double,
   primary key (teacherId)
);

alter table LessonTradeSum comment '教师累计提现表（每一次老师提现都更新此表）';

/*==============================================================*/
/* Table: LessonType                                            */
/*==============================================================*/
create table LessonType
(
   lessonType           int not null comment '正数-学生上门，负数-老师上门
            1:小学(11-16分别表示 小学1-6年级)(111-119可扩展为语数外，政史地，物化生科目代码，即：小学x年级y科目)
            2: 初中（21-23分表表示 初中1-3年级）
            3:高中（31-33分表表示 高中1-3年级）
            ',
   lessonPrice          float comment '小学：1-6
            初中：7-9
            高中：10-12',
   lessonName           varchar(50) comment '命名规范（111：小学一年级语文、112：小学一年级数学...）',
   courseName           varchar(50),
   needBook             tinyint(1) default 1 comment '0:不需要，1：需要（默认）',
   primary key (lessonType)
);

alter table LessonType comment '课时类型';

/*==============================================================*/
/* Table: OrderSum                                              */
/*==============================================================*/
create table OrderSum
(
   orderId              varchar(36) not null comment '取第一条订单ID',
   lessonType           int not null,
   parentId             varchar(36) not null,
   memberId             varchar(36) not null,
   purchaseTime         datetime not null,
   totalLessonNum       smallint,
   lessonLeftNum        smallint,
   teachingIds          varchar(360) not null comment '绑定的任教关系',
   primary key (orderId, lessonType, parentId, memberId)
);

alter table OrderSum comment '订单汇总';

/*==============================================================*/
/* Table: Order_Teaching_R                                      */
/*==============================================================*/
create table Order_Teaching_R
(
   teachingId           varchar(36) not null,
   orderId              varchar(36) not null comment '取第一条订单ID',
   lessonType           int,
   parentId             varchar(36),
   memberId             varchar(36),
   teacherId            varchar(36),
   primary key (teachingId, orderId)
);

alter table Order_Teaching_R comment '绑定任课老师的时候添加记录';

/*==============================================================*/
/* Table: Orders                                                */
/*==============================================================*/
create table Orders
(
   orderId              varchar(36) not null,
   lessonType           int not null,
   parentId             varchar(36) not null,
   memberId             varchar(36) not null,
   createTime           datetime,
   purchaseNum          smallint,
   primary key (orderId, lessonType, parentId, memberId)
);

alter table Orders comment '订单管理';

/*==============================================================*/
/* Table: Parent_Stu_R                                          */
/*==============================================================*/
create table Parent_Stu_R
(
   memberId             varchar(36) not null,
   parentId             varchar(36) not null,
   primary key (memberId, parentId)
);

alter table Parent_Stu_R comment '家属-学生关系表';

/*==============================================================*/
/* Table: Parents                                               */
/*==============================================================*/
create table Parents
(
   parentId             varchar(36) not null,
   parentName           varchar(36),
   telNum               varchar(30),
   weChatNum            varchar(36),
   openId               varchar(36),
   primary key (parentId),
   unique key AK_unique_key (openId)
);

alter table Parents comment '家长表';

/*==============================================================*/
/* Table: Picture                                               */
/*==============================================================*/
create table Picture
(
   picId                varchar(36) not null,
   picUrl               varchar(500),
   picName              varchar(200),
   picType              tinyint(2) comment '0：banner图片
            1：学员头像
            2：家长头像
            3：老师头像
            ',
   primary key (picId)
);

alter table Picture comment '图片信息表';

/*==============================================================*/
/* Table: Schedule                                              */
/*==============================================================*/
create table Schedule
(
   scheduleId           varchar(36) not null,
   teacherId            varchar(36),
   memberId             varchar(36),
   parentId             varchar(36),
   lessonType           int comment '1:小学(11-16分别表示 小学1-6年级)
            2: 初中（21-23分表表示 初中1-3年级）
            3:高中（31-33分表表示 高中1-3年级）
            ',
   createTime           datetime,
   status               tinyint(2) default 0 comment '0：未处理
            1：已指派老师',
   notes                varchar(300),
   primary key (scheduleId)
);

alter table Schedule comment '预约管理';

/*==============================================================*/
/* Table: School                                                */
/*==============================================================*/
create table School
(
   schoolId             varchar(36) not null,
   schoolName           varchar(100),
   schoolAddress        varchar(500),
   termInfo             varchar(10),
   primary key (schoolId)
);

alter table School comment '学校信息';

/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student
(
   memberId             varchar(36) not null,
   name                 varchar(100),
   classID              varchar(36),
   gradeId              varchar(36),
   schoolId             varchar(36),
   picId                varchar(36),
   isStarMember         tinyint(1) default 0 comment '0：不是
            1：是',
   gentle               tinyint(1) comment '1：男
            2：女',
   telNum               varchar(20),
   openId               varchar(36),
   primary key (memberId)
);

alter table Student comment '学员信息表 - 对应原 starStudent表';

/*==============================================================*/
/* Table: Suggestions                                           */
/*==============================================================*/
create table Suggestions
(
   lessonTradeId        varchar(36) not null,
   situations           varchar(1000) comment '以json字符串呈现，方便扩展',
   suggestions          varchar(1000) comment '以json字符串呈现，方便扩展',
   primary key (lessonTradeId)
);

/*==============================================================*/
/* Table: Teacher                                               */
/*==============================================================*/
create table Teacher
(
   teacherId            varchar(36) not null comment '对应用户表userId',
   teacherName          varchar(36),
   picId                varchar(36),
   schoolId             varchar(36),
   gradeId              varchar(36),
   sex                  tinyint(1) comment '1: 男，2：女',
   education            tinyint(2) comment '1：中专
            2：大专
            3：本科
            4：研究生
            5：博士
            6：其他',
   telNumber            varchar(20),
   teachingLevel        tinyint(2) comment '-1：黑名单
            1:普通
            2：金牌',
   regDate              datetime,
   notes                varchar(500),
   openId               varchar(36),
   signed               tinyint(1) default 0 comment '0：未签约
            1：已签约',
   primary key (teacherId)
);

alter table Teacher comment '教员表';

/*==============================================================*/
/* Table: Teacher_Les_R                                         */
/*==============================================================*/
create table Teacher_Les_R
(
   teachingId           varchar(36) not null,
   teacherId            varchar(36) not null,
   lessonType           int not null comment '1:小学(11-16分别表示 小学1-6年级)(111-119可扩展为语数外，政史地，物化生科目代码，即：小学x年级y科目)
            2: 初中（21-23分表表示 初中1-3年级）
            3:高中（31-33分表表示 高中1-3年级）
            ',
   primary key (teacherId, lessonType, teachingId)
);

alter table Teacher_Les_R comment '任教关系表（老师-擅长科目）';

/*==============================================================*/
/* Table: TeachingRecord                                        */
/*==============================================================*/
create table TeachingRecord
(
   recordId             varchar(36) not null,
   teachingId           varchar(36),
   orderId              varchar(36) comment '取第一条订单ID',
   teacherId            varchar(36),
   startTime            time,
   endTime              time,
   teachingNum          float,
   teachingDate         date,
   primary key (recordId)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   userId               varchar(36) not null comment 'uuid',
   userName             varchar(36),
   userAccountId        varchar(36) not null comment '登录账号，默认为手机号码',
   password             varchar(36) comment '登录密码，默认为手机号码后六位',
   userType             tinyint(2) comment '0：管理员
            1：学生
            2：家长
            3：老师
            4：其他',
   userPrivilege        tinyint(2) comment '当用户类型为老师时，该字段标识老师签约状态（0：未签约，1：已签约）',
   loginStatus          tinyint(1) comment '0：未登录
            1：已登录',
   openId               varchar(100),
   nickname             varchar(100),
   headimgurl           text,
   primary key (userId, userAccountId)
);

alter table User comment 'User表--登录权限';