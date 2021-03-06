package com.codingSchool.webApp.Model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class InsertForm {

    private static final String EMAIL_PATTERN = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,63}$";
    private static final String SSN_PATTERN = "^[1-9]{1}[0-9]{8}$";
    private static final int SSN_MINSIZE = 9;
    private static final String PASSWORD_PATTERN = "^[a-zA-Z0-9@#$%^&]*$";
    private static final int PASSWORD_MINSIZE = 6;
    private static final String NAME_PATTERN = "^[a-zA-z]*$";
    private static final String ADDRESS_PATTERN = "[A-Za-z-.]+[ ]+[0-9]{1,4}$";

    @NotNull(message = "{insert.email.null}")
    @Pattern(regexp = EMAIL_PATTERN, message = "{insert.email.invalid}")
    private String email;

    @NotNull(message = "{insert.ssn.null}")
    @Pattern(regexp = SSN_PATTERN, message = "{insert.ssn.invalid}")
    @Size(min = SSN_MINSIZE, message = "{insert.ssn.size}")
    private String ssn;

    @NotNull(message = "{insert.password.null}")
    @Pattern(regexp = PASSWORD_PATTERN, message = "{insert.password.invalid}")
    @Size(min = PASSWORD_MINSIZE, message = "{insert.password.size}")
    private String password;

    @Size(min=2)
    @Pattern(regexp = NAME_PATTERN, message = "{insert.name.invalid}")
    private String lastname;

    @Size(min=2)
    @Pattern(regexp = NAME_PATTERN, message = "{insert.name.invalid}")
    private String firstname;

    @Pattern(regexp = ADDRESS_PATTERN, message = "{insert.address.invalid}")
    @Size(min=2)
    private String address;

    @NotNull(message = "{insert.typeofuser.null}")
    private String typeofuser;

    private long userid;

    public Long getUserid() {
        return userid;
    }

    public String getSsn() {
        return ssn;
    }

    public void setSsn(String ssn) {
        this.ssn = ssn;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String isTypeofuser() {
        return typeofuser;
    }

    public void setTypeofuser(String typeofuser) {
        this.typeofuser = typeofuser;
    }

    public String getTypeofuser() {
        return typeofuser;
    }
}
