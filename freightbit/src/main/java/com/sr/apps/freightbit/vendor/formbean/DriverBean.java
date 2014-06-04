package com.sr.apps.freightbit.vendor.formbean;

public class DriverBean {

    private Integer driverId;
    private String driverCode;
    private String licenseNumber;
    private String lastName;
    private String firstName;
    private String title;
    private String middleName;
    private String status;

    public DriverBean() {
    }

    public DriverBean(Integer driverId, String driverCode, String licenseNumber,
                      String lastName, String firstName, String title, String middleName,
                      String status) {
        this.driverId = driverId;
        this.driverCode = driverCode;
        this.licenseNumber = licenseNumber;
        this.lastName = lastName;
        this.firstName = firstName;
        this.title = title;
        this.middleName = middleName;
        this.status = status;
    }

    public Integer getDriverId() {
        return driverId;
    }

    public void setDriverId(Integer driverId) {
        this.driverId = driverId;
    }

    public String getDriverCode() {
        return driverCode;
    }

    public void setDriverCode(String driverCode) {
        this.driverCode = driverCode;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
