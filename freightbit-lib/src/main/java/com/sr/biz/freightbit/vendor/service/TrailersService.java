package com.sr.biz.freightbit.vendor.service;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 */

import com.sr.biz.freightbit.vendor.entity.Trailers;
import com.sr.biz.freightbit.vendor.exceptions.TrailersAlreadyExistsException;

import java.util.List;

public interface TrailersService {

    public void addTrailers(Trailers trailers) throws TrailersAlreadyExistsException;

    public void updateTrailers(Trailers trailers);

    public void deleteTrailers(Trailers trailers);

    public Trailers findTrailersById(Integer trailerId);

    public List<Trailers> findAllTrailersByClientId(Integer trailerId);

    public List<Trailers> findAllTrailers();

    public Trailers findTrailersByTrailerCode(String trailerCode);

}
