package com.sr.biz.freightbit.vendor.service.impl;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 */

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.vendor.dao.TrailersDao;
import com.sr.biz.freightbit.vendor.exceptions.TrailersAlreadyExistsException;
import com.sr.biz.freightbit.vendor.service.TrailersService;
import com.sr.biz.freightbit.vendor.entity.Trailers;

public class TrailersServiceImpl implements TrailersService {

    private TrailersDao trailersDao;

    public void setTrailersDao(TrailersDao trailersDao){
        this.trailersDao = trailersDao;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addTrailers(Trailers trailers) throws TrailersAlreadyExistsException {
        if (trailersDao.findTrailersByTrailerCode(trailers.getTrailerCode())!=null)
            throw new TrailersAlreadyExistsException(trailers.getTrailerCode());
        else
            trailersDao.addTrailers(trailers);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateTrailers(Trailers trailers) {
        trailersDao.updateTrailers(trailers);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteTrailers(Trailers trailers) {
        trailersDao.deleteTrailers(trailers);
    }

    @Override
    public Trailers findTrailersById(Integer trailerId) {
        return trailersDao.findTrailersById(trailerId);
    }

    @Override
    public List<Trailers> findAllTrailersByClientId (Integer clientId) {
        return trailersDao.findAllTrailersByClientId(clientId);
    }

    @Override
    public List<Trailers> findAllTrailers() {
        List<Trailers> trailers = trailersDao.findAllTrailers();
        return trailers;
    }

    @Override
 public Trailers findTrailersByTrailerCode(String trailerCode) {
        List<Trailers> result = trailersDao.findTrailersByTrailerCode(trailerCode);
        if (result != null && !result.isEmpty()) {
            return result.get(0);
        }
      return null;
    }
}
