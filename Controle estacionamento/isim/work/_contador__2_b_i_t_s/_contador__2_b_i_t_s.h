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

#ifndef H_workM_contador__2_b_i_t_s_H
#define H_workM_contador__2_b_i_t_s_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class workM_contador__2_b_i_t_s : public HSim__s5{
public: 
    workM_contador__2_b_i_t_s(const char *instname);
    ~workM_contador__2_b_i_t_s();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    HSim::ValueS* up1Func(HSim::VlogVarType& outVarType, int& outNumScalars, int inNumScalars);
    class cu0 : public HSimVlogTask{
    public: 
        cu0(workM_contador__2_b_i_t_s* arch );
        HSimVlogTaskCall * createTaskCall(HSim__s7 * process );
        void deleteTaskCall(HSimVlogTaskCall *p );
        void reset();
        void constructObject();
        int getSizeForArg(int argNumber);
        workM_contador__2_b_i_t_s* Arch ;
        HSimVector<HSimRegion *> activeInstanceList ;
        HSimVector<HSimRegion *>  availableTaskCallObjList ;
        ~cu0();
        bool disable(HSim__s7* proc);
    };
    cu0 u0;
    class cu1 : public HSimVlogTask{
    public: 
        cu1(workM_contador__2_b_i_t_s* arch );
        HSimVlogTaskCall * createTaskCall(HSim__s7 * process );
        void deleteTaskCall(HSimVlogTaskCall *p );
        void reset();
        void constructObject();
        int getSizeForArg(int argNumber);
        workM_contador__2_b_i_t_s* Arch ;
        HSimVector<HSimRegion *> activeInstanceList ;
        HSimVector<HSimRegion *>  availableTaskCallObjList ;
        ~cu1();
        bool disable(HSim__s7* proc);
    };
    cu1 u1;
    HSim__s1 us[2];
    HSim__s3 uv[4];
    HSimVlogParam up[3];
};

#endif
