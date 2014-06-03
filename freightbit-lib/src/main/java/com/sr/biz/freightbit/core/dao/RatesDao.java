package com.sr.biz.freightbit.core.dao;

import java.util.List;

import com.sr.biz.freightbit.core.entity.Rates;

/**
 * Created by Solutions Resource on 5/27/14.
 */
public interface RatesDao {

    public void addRate(Rates rates);

    public void deleteRate(Rates rate);

    public List<Rates> findAllRates(Integer customerRateId);

    public List<Rates> findAllRatesByRatesId(Integer customerRateId);

    public Rates findRateById(Integer customerRateId);

    public void updateRate(Rates rate);

    public List<Rates> findAllRatesByClientId(Integer clientId);

}
