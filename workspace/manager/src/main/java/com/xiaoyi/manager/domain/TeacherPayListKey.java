package com.xiaoyi.manager.domain;

public class TeacherPayListKey {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column teacher_pay_list.lessonTypeId
     *
     * @mbggenerated Mon Mar 12 11:32:25 CST 2018
     */
    private Integer lessontypeid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column teacher_pay_list.feedbackId
     *
     * @mbggenerated Mon Mar 12 11:32:25 CST 2018
     */
    private Short feedbackid;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column teacher_pay_list.lessonTypeId
     *
     * @return the value of teacher_pay_list.lessonTypeId
     *
     * @mbggenerated Mon Mar 12 11:32:25 CST 2018
     */
    public Integer getLessontypeid() {
        return lessontypeid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column teacher_pay_list.lessonTypeId
     *
     * @param lessontypeid the value for teacher_pay_list.lessonTypeId
     *
     * @mbggenerated Mon Mar 12 11:32:25 CST 2018
     */
    public void setLessontypeid(Integer lessontypeid) {
        this.lessontypeid = lessontypeid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column teacher_pay_list.feedbackId
     *
     * @return the value of teacher_pay_list.feedbackId
     *
     * @mbggenerated Mon Mar 12 11:32:25 CST 2018
     */
    public Short getFeedbackid() {
        return feedbackid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column teacher_pay_list.feedbackId
     *
     * @param feedbackid the value for teacher_pay_list.feedbackId
     *
     * @mbggenerated Mon Mar 12 11:32:25 CST 2018
     */
    public void setFeedbackid(Short feedbackid) {
        this.feedbackid = feedbackid;
    }
}