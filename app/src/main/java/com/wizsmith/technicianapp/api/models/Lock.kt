package com.wizsmith.technicianapp.models

data class Lock(
    val lockId: String,
    val lockName: String,
    val lockMac: String,
    val lockVersion: String,
    val electricQuantity: Int
)
