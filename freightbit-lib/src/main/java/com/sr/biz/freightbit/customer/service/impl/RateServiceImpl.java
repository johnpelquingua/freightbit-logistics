package com.sr.biz.freightbit.customer.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.sr.biz.freightbit.customer.dao.RatesDao;
import com.sr.biz.freightbit.customer.entity.Rates;
import com.sr.biz.freightbit.customer.service.RateService;

/**
 * Created by Solutions Resource on 5/27/14.
 */
public class RateServiceImpl  implements RateService  {


    private RatesDao ratesDao;

    public void setRatesDao(RatesDao ratesDao) {
        this.ratesDao = ratesDao;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addRate(Rates rate) {

            ratesDao.addRate(rate);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteRate(Rates rate) {
        ratesDao.deleteRate(rate);
    }



    @Override
    public List<Rates> findAllRates(Integer customerRateId) {
        List<Rates> rates = ratesDao.findAllRates(customerRateId);
        return rates;
    }

    @Override
    public Rates findRateById(Integer customerRateId) {
        return ratesDao.findRateById(customerRateId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateRate(Rates rates) {
        ratesDao.updateRate(rates);
    }

}
