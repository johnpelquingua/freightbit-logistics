package com.sr.biz.freightbit.order.entity;

/**
 * Created by user on 9/29/2014.
 */
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "countertable"
        , catalog = "freightbit")

public class Counter implements Serializable{
    private Integer idCounterTable;
    private String addedType;


    public Counter(){

    }


    public Counter(Integer idCounterTable, String addedType) {
        this.idCounterTable = idCounterTable;
        this.addedType = addedType;
    }




    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="idCounterTable",unique=true,nullable = false)


    public Integer getIdCounterTable() {
        return idCounterTable;
    }

    public void setIdCounterTable(Integer idCounterTable) {
        this.idCounterTable = idCounterTable;
    }


    @Column(name="addedType",nullable = false)
    public String getAddedType() {
        return addedType;
    }

    public void setAddedType(String addedType) {
        this.addedType = addedType;
    }
}
