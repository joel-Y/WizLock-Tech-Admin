package com.wizsmith.technicianapp.api

import com.wizsmith.technicianapp.models.LockListResponse
import retrofit2.http.GET
import retrofit2.http.Query

interface TTLockApi {
    @GET("v3/lock/list")
    suspend fun getLocks(
        @Query("clientId") clientId: String,
        @Query("accessToken") accessToken: String,
        @Query("pageNo") pageNo: Int = 1,
        @Query("pageSize") pageSize: Int = 50
    ): LockListResponse
}
