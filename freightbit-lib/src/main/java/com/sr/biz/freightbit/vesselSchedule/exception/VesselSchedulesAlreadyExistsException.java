package com.sr.biz.freightbit.vesselSchedule.exception;

import com.sr.biz.freightbit.core.exceptions.ObjectAlreadyExistsException;

/**
 * Created by Clarence C. Victoria on 7/22/14.
 */
public class VesselSchedulesAlreadyExistsException extends ObjectAlreadyExistsException{

    public VesselSchedulesAlreadyExistsException(String msg) {
        super (msg);
    }

    public VesselSchedulesAlreadyExistsException(String msg, Throwable cause) {
        super (msg, cause);
    }

    public VesselSchedulesAlreadyExistsException(Integer vesselScheduleId) {
        super (vesselScheduleId);
    }

    public VesselSchedulesAlreadyExistsException(Integer vesselScheduleId, Throwable cause) {
        super (vesselScheduleId, cause);
    }

}
