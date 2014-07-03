package com.sr.biz.freightbit.vendor.dao;

/**
 * Created with IntelliJ IDEA.
 * User: johnpelquingua.com
 */

import com.sr.biz.freightbit.vendor.entity.Trailers;

import java.util.List;

public interface TrailersDao {

    public void updateTrailers(Trailers trailers);

    public void addTrailers(Trailers trailers);

    public void deleteTrailers(Trailers trailers);

    public Trailers findTrailersById(Integer trailerId);

    public List<Trailers> findAllTrailersByClientId(Integer clientId);

    public List<Trailers> findTrailersByTrailerCode(String trailerCode);

    public List<Trailers> findAllTrailers();

}
