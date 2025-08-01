# SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
#
# SPDX-License-Identifier: LicenseRef-NVIDIA-SOFTWARE-LICENSE
#
# This code was automatically generated across versions from 12.0.1 to 12.9.0. Do not modify it directly.

from libc.stdint cimport intptr_t

from .utils import FunctionNotFoundError, NotSupportedError

from cuda.bindings import path_finder

import win32api


###############################################################################
# Wrapper init
###############################################################################

LOAD_LIBRARY_SEARCH_SYSTEM32     = 0x00000800
LOAD_LIBRARY_SEARCH_DEFAULT_DIRS = 0x00001000
LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR = 0x00000100
cdef bint __py_nvjitlink_init = False
cdef void* __cuDriverGetVersion = NULL

cdef void* __nvJitLinkCreate = NULL
cdef void* __nvJitLinkDestroy = NULL
cdef void* __nvJitLinkAddData = NULL
cdef void* __nvJitLinkAddFile = NULL
cdef void* __nvJitLinkComplete = NULL
cdef void* __nvJitLinkGetLinkedCubinSize = NULL
cdef void* __nvJitLinkGetLinkedCubin = NULL
cdef void* __nvJitLinkGetLinkedPtxSize = NULL
cdef void* __nvJitLinkGetLinkedPtx = NULL
cdef void* __nvJitLinkGetErrorLogSize = NULL
cdef void* __nvJitLinkGetErrorLog = NULL
cdef void* __nvJitLinkGetInfoLogSize = NULL
cdef void* __nvJitLinkGetInfoLog = NULL
cdef void* __nvJitLinkVersion = NULL


cdef int _check_or_init_nvjitlink() except -1 nogil:
    global __py_nvjitlink_init
    if __py_nvjitlink_init:
        return 0

    cdef int err, driver_ver
    with gil:
        # Load driver to check version
        try:
            handle = win32api.LoadLibraryEx("nvcuda.dll", 0, LOAD_LIBRARY_SEARCH_SYSTEM32)
        except Exception as e:
            raise NotSupportedError(f'CUDA driver is not found ({e})')
        global __cuDriverGetVersion
        if __cuDriverGetVersion == NULL:
            __cuDriverGetVersion = <void*><intptr_t>win32api.GetProcAddress(handle, 'cuDriverGetVersion')
            if __cuDriverGetVersion == NULL:
                raise RuntimeError('something went wrong')
        err = (<int (*)(int*) noexcept nogil>__cuDriverGetVersion)(&driver_ver)
        if err != 0:
            raise RuntimeError('something went wrong')

        # Load library
        handle = path_finder._load_nvidia_dynamic_library("nvJitLink").handle

        # Load function
        global __nvJitLinkCreate
        try:
            __nvJitLinkCreate = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkCreate')
        except:
            pass

        global __nvJitLinkDestroy
        try:
            __nvJitLinkDestroy = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkDestroy')
        except:
            pass

        global __nvJitLinkAddData
        try:
            __nvJitLinkAddData = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkAddData')
        except:
            pass

        global __nvJitLinkAddFile
        try:
            __nvJitLinkAddFile = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkAddFile')
        except:
            pass

        global __nvJitLinkComplete
        try:
            __nvJitLinkComplete = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkComplete')
        except:
            pass

        global __nvJitLinkGetLinkedCubinSize
        try:
            __nvJitLinkGetLinkedCubinSize = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkGetLinkedCubinSize')
        except:
            pass

        global __nvJitLinkGetLinkedCubin
        try:
            __nvJitLinkGetLinkedCubin = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkGetLinkedCubin')
        except:
            pass

        global __nvJitLinkGetLinkedPtxSize
        try:
            __nvJitLinkGetLinkedPtxSize = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkGetLinkedPtxSize')
        except:
            pass

        global __nvJitLinkGetLinkedPtx
        try:
            __nvJitLinkGetLinkedPtx = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkGetLinkedPtx')
        except:
            pass

        global __nvJitLinkGetErrorLogSize
        try:
            __nvJitLinkGetErrorLogSize = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkGetErrorLogSize')
        except:
            pass

        global __nvJitLinkGetErrorLog
        try:
            __nvJitLinkGetErrorLog = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkGetErrorLog')
        except:
            pass

        global __nvJitLinkGetInfoLogSize
        try:
            __nvJitLinkGetInfoLogSize = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkGetInfoLogSize')
        except:
            pass

        global __nvJitLinkGetInfoLog
        try:
            __nvJitLinkGetInfoLog = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkGetInfoLog')
        except:
            pass

        global __nvJitLinkVersion
        try:
            __nvJitLinkVersion = <void*><intptr_t>win32api.GetProcAddress(handle, 'nvJitLinkVersion')
        except:
            pass

    __py_nvjitlink_init = True
    return 0


cdef dict func_ptrs = None


cpdef dict _inspect_function_pointers():
    global func_ptrs
    if func_ptrs is not None:
        return func_ptrs

    _check_or_init_nvjitlink()
    cdef dict data = {}

    global __nvJitLinkCreate
    data["__nvJitLinkCreate"] = <intptr_t>__nvJitLinkCreate

    global __nvJitLinkDestroy
    data["__nvJitLinkDestroy"] = <intptr_t>__nvJitLinkDestroy

    global __nvJitLinkAddData
    data["__nvJitLinkAddData"] = <intptr_t>__nvJitLinkAddData

    global __nvJitLinkAddFile
    data["__nvJitLinkAddFile"] = <intptr_t>__nvJitLinkAddFile

    global __nvJitLinkComplete
    data["__nvJitLinkComplete"] = <intptr_t>__nvJitLinkComplete

    global __nvJitLinkGetLinkedCubinSize
    data["__nvJitLinkGetLinkedCubinSize"] = <intptr_t>__nvJitLinkGetLinkedCubinSize

    global __nvJitLinkGetLinkedCubin
    data["__nvJitLinkGetLinkedCubin"] = <intptr_t>__nvJitLinkGetLinkedCubin

    global __nvJitLinkGetLinkedPtxSize
    data["__nvJitLinkGetLinkedPtxSize"] = <intptr_t>__nvJitLinkGetLinkedPtxSize

    global __nvJitLinkGetLinkedPtx
    data["__nvJitLinkGetLinkedPtx"] = <intptr_t>__nvJitLinkGetLinkedPtx

    global __nvJitLinkGetErrorLogSize
    data["__nvJitLinkGetErrorLogSize"] = <intptr_t>__nvJitLinkGetErrorLogSize

    global __nvJitLinkGetErrorLog
    data["__nvJitLinkGetErrorLog"] = <intptr_t>__nvJitLinkGetErrorLog

    global __nvJitLinkGetInfoLogSize
    data["__nvJitLinkGetInfoLogSize"] = <intptr_t>__nvJitLinkGetInfoLogSize

    global __nvJitLinkGetInfoLog
    data["__nvJitLinkGetInfoLog"] = <intptr_t>__nvJitLinkGetInfoLog

    global __nvJitLinkVersion
    data["__nvJitLinkVersion"] = <intptr_t>__nvJitLinkVersion

    func_ptrs = data
    return data


cpdef _inspect_function_pointer(str name):
    global func_ptrs
    if func_ptrs is None:
        func_ptrs = _inspect_function_pointers()
    return func_ptrs[name]


###############################################################################
# Wrapper functions
###############################################################################

cdef nvJitLinkResult _nvJitLinkCreate(nvJitLinkHandle* handle, uint32_t numOptions, const char** options) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkCreate
    _check_or_init_nvjitlink()
    if __nvJitLinkCreate == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkCreate is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle*, uint32_t, const char**) noexcept nogil>__nvJitLinkCreate)(
        handle, numOptions, options)


cdef nvJitLinkResult _nvJitLinkDestroy(nvJitLinkHandle* handle) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkDestroy
    _check_or_init_nvjitlink()
    if __nvJitLinkDestroy == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkDestroy is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle*) noexcept nogil>__nvJitLinkDestroy)(
        handle)


cdef nvJitLinkResult _nvJitLinkAddData(nvJitLinkHandle handle, nvJitLinkInputType inputType, const void* data, size_t size, const char* name) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkAddData
    _check_or_init_nvjitlink()
    if __nvJitLinkAddData == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkAddData is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle, nvJitLinkInputType, const void*, size_t, const char*) noexcept nogil>__nvJitLinkAddData)(
        handle, inputType, data, size, name)


cdef nvJitLinkResult _nvJitLinkAddFile(nvJitLinkHandle handle, nvJitLinkInputType inputType, const char* fileName) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkAddFile
    _check_or_init_nvjitlink()
    if __nvJitLinkAddFile == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkAddFile is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle, nvJitLinkInputType, const char*) noexcept nogil>__nvJitLinkAddFile)(
        handle, inputType, fileName)


cdef nvJitLinkResult _nvJitLinkComplete(nvJitLinkHandle handle) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkComplete
    _check_or_init_nvjitlink()
    if __nvJitLinkComplete == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkComplete is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle) noexcept nogil>__nvJitLinkComplete)(
        handle)


cdef nvJitLinkResult _nvJitLinkGetLinkedCubinSize(nvJitLinkHandle handle, size_t* size) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkGetLinkedCubinSize
    _check_or_init_nvjitlink()
    if __nvJitLinkGetLinkedCubinSize == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkGetLinkedCubinSize is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle, size_t*) noexcept nogil>__nvJitLinkGetLinkedCubinSize)(
        handle, size)


cdef nvJitLinkResult _nvJitLinkGetLinkedCubin(nvJitLinkHandle handle, void* cubin) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkGetLinkedCubin
    _check_or_init_nvjitlink()
    if __nvJitLinkGetLinkedCubin == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkGetLinkedCubin is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle, void*) noexcept nogil>__nvJitLinkGetLinkedCubin)(
        handle, cubin)


cdef nvJitLinkResult _nvJitLinkGetLinkedPtxSize(nvJitLinkHandle handle, size_t* size) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkGetLinkedPtxSize
    _check_or_init_nvjitlink()
    if __nvJitLinkGetLinkedPtxSize == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkGetLinkedPtxSize is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle, size_t*) noexcept nogil>__nvJitLinkGetLinkedPtxSize)(
        handle, size)


cdef nvJitLinkResult _nvJitLinkGetLinkedPtx(nvJitLinkHandle handle, char* ptx) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkGetLinkedPtx
    _check_or_init_nvjitlink()
    if __nvJitLinkGetLinkedPtx == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkGetLinkedPtx is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle, char*) noexcept nogil>__nvJitLinkGetLinkedPtx)(
        handle, ptx)


cdef nvJitLinkResult _nvJitLinkGetErrorLogSize(nvJitLinkHandle handle, size_t* size) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkGetErrorLogSize
    _check_or_init_nvjitlink()
    if __nvJitLinkGetErrorLogSize == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkGetErrorLogSize is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle, size_t*) noexcept nogil>__nvJitLinkGetErrorLogSize)(
        handle, size)


cdef nvJitLinkResult _nvJitLinkGetErrorLog(nvJitLinkHandle handle, char* log) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkGetErrorLog
    _check_or_init_nvjitlink()
    if __nvJitLinkGetErrorLog == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkGetErrorLog is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle, char*) noexcept nogil>__nvJitLinkGetErrorLog)(
        handle, log)


cdef nvJitLinkResult _nvJitLinkGetInfoLogSize(nvJitLinkHandle handle, size_t* size) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkGetInfoLogSize
    _check_or_init_nvjitlink()
    if __nvJitLinkGetInfoLogSize == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkGetInfoLogSize is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle, size_t*) noexcept nogil>__nvJitLinkGetInfoLogSize)(
        handle, size)


cdef nvJitLinkResult _nvJitLinkGetInfoLog(nvJitLinkHandle handle, char* log) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkGetInfoLog
    _check_or_init_nvjitlink()
    if __nvJitLinkGetInfoLog == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkGetInfoLog is not found")
    return (<nvJitLinkResult (*)(nvJitLinkHandle, char*) noexcept nogil>__nvJitLinkGetInfoLog)(
        handle, log)


cdef nvJitLinkResult _nvJitLinkVersion(unsigned int* major, unsigned int* minor) except?_NVJITLINKRESULT_INTERNAL_LOADING_ERROR nogil:
    global __nvJitLinkVersion
    _check_or_init_nvjitlink()
    if __nvJitLinkVersion == NULL:
        with gil:
            raise FunctionNotFoundError("function nvJitLinkVersion is not found")
    return (<nvJitLinkResult (*)(unsigned int*, unsigned int*) noexcept nogil>__nvJitLinkVersion)(
        major, minor)
