package com.sr.biz.freightbit.core.service;

import java.util.List;
import com.sr.biz.freightbit.core.dao.RatesDao;
import com.sr.biz.freightbit.core.entity.Rates;
import com.sr.biz.freightbit.core.exceptions.RateAlreadyExistsException;

/**
 * Created by Solutions Resource on 5/27/14.
 */
public interface RateService {

    public void addRate(Rates rate);

    public void deleteRate(Rates rate);

    public void updateRate(Rates rates);

    public Rates findRateById(Integer customerRateId);

    public List<Rates> findAllRates(Integer customerRateId);



}
