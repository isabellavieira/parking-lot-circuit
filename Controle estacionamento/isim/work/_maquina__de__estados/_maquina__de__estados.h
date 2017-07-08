////////////////////////////////////////////////////////////////////////////////
//   ____  ____  
//  /   /\/   /  
// /___/  \  /   
// \   \   \/    
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /___/   /\   
// \   \  /  \  
//  \___\/\___\ 
////////////////////////////////////////////////////////////////////////////////

#ifndef H_workM_maquina__de__estados_H
#define H_workM_maquina__de__estados_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class workM_maquina__de__estados : public HSim__s5{
public: 
    workM_maquina__de__estados(const char *instname);
    ~workM_maquina__de__estados();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    HSim::ValueS* up0Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim::ValueS* up1Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim::ValueS* up2Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim::ValueS* up3Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim::ValueS* up4Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim::ValueS* up5Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim::ValueS* up6Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim::ValueS* up7Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim::ValueS* up8Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    HSim__s1 us[6];
    HSim__s3 uv[2];
    HSimVlogParam up[9];
};

#endif
