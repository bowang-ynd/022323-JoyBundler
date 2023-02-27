package com.bowang.joybundler.models.Name;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.bowang.joybundler.models.User;

@Entity
@Table(name="names")
public class Name {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Size(min=2, message="Name should be at least 2 characters!")
    private String babyName;
    
    @NotNull
    private String gender;

    @NotNull
    @Size(min=1, message="Origin should not be blank!")
    private String origin;

    @NotNull
    @Size(min=1, message="Meaning should not be blank!")
    private String meaning;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="userId")
    private User user;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "votes", 
        joinColumns = @JoinColumn(name = "nameId"), 
        inverseJoinColumns = @JoinColumn(name = "userId")
    )
    private List<User> users;

    private Integer votes;

    @Column(updatable = false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;


    public Name() {
    }

    public Name(Long id, String babyName, String gender, String origin, String meaning, User user) {
        this.id = id;
        this.babyName = babyName;
        this.gender = gender;
        this.origin = origin;
        this.meaning = meaning;
        this.user = user;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBabyName() {
        return this.babyName;
    }

    public void setBabyName(String babyName) {
        this.babyName = babyName;
    }

    public String getGender() {
        return this.gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getOrigin() {
        return this.origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getMeaning() {
        return this.meaning;
    }

    public void setMeaning(String meaning) {
        this.meaning = meaning;
    }

    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<User> getUsers() {
        return this.users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public Integer getVotes() {
        this.votes = this.users.size();
        return this.votes;
    }

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

}
