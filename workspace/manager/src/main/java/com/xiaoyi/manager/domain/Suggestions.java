package com.xiaoyi.manager.domain;

public class Suggestions {
    private String lessontradeid;

    private String situations;

    private String suggestions;

    public String getLessontradeid() {
        return lessontradeid;
    }

    public void setLessontradeid(String lessontradeid) {
        this.lessontradeid = lessontradeid == null ? null : lessontradeid.trim();
    }

    public String getSituations() {
        return situations;
    }

    public void setSituations(String situations) {
        this.situations = situations == null ? null : situations.trim();
    }

    public String getSuggestions() {
        return suggestions;
    }

    public void setSuggestions(String suggestions) {
        this.suggestions = suggestions == null ? null : suggestions.trim();
    }
}