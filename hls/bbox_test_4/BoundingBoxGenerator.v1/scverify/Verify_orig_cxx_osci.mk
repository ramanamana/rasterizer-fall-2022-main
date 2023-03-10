# ----------------------------------------------------------------------------
# Original Design + Testbench
#
#    HLS version: 10.4b/841621 Production Release
#       HLS date: Thu Oct 24 17:20:07 PDT 2019
#  Flow Packages: HDL_Tcl 8.0a, SCVerify 10.4
#
#   Generated by: ramana7@caddy02
# Generated date: Wed Dec 14 13:40:24 PST 2022
#
# ----------------------------------------------------------------------------
# ===================================================
# DEFAULT GOAL is the help target
.PHONY: all
all: help

# ===================================================
# Directories (at the time this makefile was created)
#   MGC_HOME      /cad/mentor/2019.11/Catapult_Synthesis_10.4b-841621/Mgc_home
#   PROJECT_HOME  /afs/ir.stanford.edu/users/r/a/ramana7/rasterizer-fall-2022-main/hls
#   SOLUTION_DIR  /afs/ir.stanford.edu/users/r/a/ramana7/rasterizer-fall-2022-main/hls/bbox_test_4/BoundingBoxGenerator.v1
#   WORKING_DIR   /afs/ir.stanford.edu/users/r/a/ramana7/rasterizer-fall-2022-main/hls/bbox_test_4/BoundingBoxGenerator.v1/.

# ===================================================
# VARIABLES
# 
MGC_HOME          = /cad/mentor/2019.11/Catapult_Synthesis_10.4b-841621/Mgc_home
export MGC_HOME

WORK_DIR  = $(CURDIR)
WORK2PROJ = ../..
WORK2SOLN = .
PROJ2WORK = ./bbox_test_4/BoundingBoxGenerator.v1
PROJ2SOLN = ./bbox_test_4/BoundingBoxGenerator.v1
export WORK_DIR
export WORK2PROJ
export WORK2SOLN
export PROJ2WORK
export PROJ2SOLN

# Variables that can be overridden from the make command line
ifeq "$(INCL_DIRS)" ""
INCL_DIRS                   =  .
endif
export INCL_DIRS
ifeq "$(STAGE)" ""
STAGE                       = orig
endif
export STAGE
ifeq "$(NETLIST_LEAF)" ""
NETLIST_LEAF                = orig
endif
export NETLIST_LEAF
ifeq "$(SIMTOOL)" ""
SIMTOOL                     = osci
endif
export SIMTOOL
ifeq "$(NETLIST)" ""
NETLIST                     = cxx
endif
export NETLIST
ifeq "$(RTL_NETLIST_FNAME)" ""
RTL_NETLIST_FNAME           = /afs/ir.stanford.edu/users/r/a/ramana7/rasterizer-fall-2022-main/hls/bbox_test_4/BoundingBoxGenerator.v1/orig
endif
export RTL_NETLIST_FNAME
ifeq "$(INVOKE_ARGS)" ""
INVOKE_ARGS                 = 
endif
export INVOKE_ARGS
export SCVLIBS
LINK_SYSTEMC             := true
TOP_HDL_ENTITY           := dummy
TOP_DU                   := scverify_top
TARGET                   := scverify/$(NETLIST_LEAF)_$(NETLIST)_$(SIMTOOL)
LINK_SYSTEMC             := true
export TOP_HDL_ENTITY
export TARGET

ifeq ($(RECUR),)
ifeq ($(STAGE),mapped)
ifeq ($(RTLTOOL),)
   $(error This makefile requires specifying the RTLTOOL variable on the make command line)
endif
endif
endif
# ===================================================
# Include environment variables set by flow options
include ./ccs_env.mk

# ===================================================
# Include makefile for default commands and variables
include $(MGC_HOME)/shared/include/mkfiles/ccs_default_cmds.mk

SYNTHESIS_FLOWPKG := DesignCompiler
SYN_FLOW          := 
# ===================================================
# SOURCES
# 
# Specify list of Questa SIM libraries to create
HDL_LIB_NAMES = work
# ===================================================
# Simulation libraries required by loaded Catapult libraries or gate simulation
SIMLIBS_V   += 
SIMLIBS_VHD += 
# 
# Specify list of source files - MUST be ordered properly
ifeq ($(STAGE),gate)
ifeq ($(RTLTOOL),)
ifeq ($(GATE_VHDL_DEP),)
GATE_VHDL_DEP = 
endif
ifeq ($(GATE_VLOG_DEP),)
GATE_VLOG_DEP = 
endif
endif
VHDL_SRC +=  $(GATE_VHDL_DEP)
VLOG_SRC +=  $(GATE_VLOG_DEP)
else
VHDL_SRC += 
VLOG_SRC += 
endif
CXX_SRC  = ../../src/rasterizer_top.cpp/rasterizer_top.cpp.cxxts ../../src/bbox_testbench.cpp/bbox_testbench.cpp.cxxts ../../../gold/rasterizer.c/rasterizer.c.cxxts
# Specify RTL synthesis scripts (if any)
RTL_SCRIPT = 

# Specify hold time file name (for verifying synthesized netlists)
HLD_CONSTRAINT_FNAME = top_gate_constraints.cpp

# ===================================================
# GLOBAL OPTIONS
# 
# CXXFLAGS - global C++ options (apply to all C++ compilations) except for include file search paths
CXXFLAGS += -DSC_INCLUDE_DYNAMIC_PROCESSES -DSC_USE_STD_STRING -DCCS_MISMATCHED_OUTPUTS_ONLY
# 
# If the make command line includes a definition of the special variable MC_DEFAULT_TRANSACTOR_LOG
# then define that value for all compilations as well
ifneq "$(MC_DEFAULT_TRANSACTOR_LOG)" ""
CXXFLAGS += -DMC_DEFAULT_TRANSACTOR_LOG=$(MC_DEFAULT_TRANSACTOR_LOG)
endif
# 
# CXX_INCLUDES - include file search paths
CXX_INCLUDES = . ../..
# 
# TCL shell
TCLSH_CMD = /cad/mentor/2019.11/Catapult_Synthesis_10.4b-841621/Mgc_home/bin/tclsh8.5

# Pass along SCVerify_DEADLOCK_DETECTION option
ifneq "$(SCVerify_DEADLOCK_DETECTION)" "false"
CXXFLAGS += -DDEADLOCK_DETECTION
endif
# ===================================================
# PER SOURCE FILE SPECIALIZATIONS
# 
# Specify source file paths
ifeq ($(STAGE),gate)
ifneq ($(GATE_VHDL_DEP),)
$(TARGET)/$(notdir $(GATE_VHDL_DEP)): $(dir $(GATE_VHDL_DEP))
endif
ifneq ($(GATE_VLOG_DEP),)
$(TARGET)/$(notdir $(GATE_VLOG_DEP)): $(dir $(GATE_VLOG_DEP))
endif
endif
$(TARGET)/rasterizer_top.cpp.cxxts: ../../src/rasterizer_top.cpp
$(TARGET)/bbox_testbench.cpp.cxxts: ../../src/bbox_testbench.cpp
$(TARGET)/rasterizer.c.cxxts: ../../../gold/rasterizer.c
# 
# Specify additional C++ options per C++ source by setting CXX_OPTS
$(TARGET)/rasterizer_top.cpp.cxxts: CXX_OPTS=
$(TARGET)/rasterizer.c.cxxts: CXX_OPTS=
$(TARGET)/bbox_testbench.cpp.cxxts: CXX_OPTS=
# 
# Specify dependencies
$(TARGET)/rasterizer_top.cpp.cxxts: .ccs_env_opts/SCVerify_USE_CCS_BLOCK.ts
$(TARGET)/bbox_testbench.cpp.cxxts: .ccs_env_opts/SCVerify_USE_CCS_BLOCK.ts
$(TARGET)/rasterizer.c.cxxts: .ccs_env_opts/SCVerify_USE_CCS_BLOCK.ts
# 
# Specify compilation library for HDL source
ifeq ($(STAGE),gate)
ifneq ($(GATE_VHDL_DEP),)
$(TARGET)/$(notdir $(GATE_VHDL_DEP)): HDL_LIB=work
endif
ifneq ($(GATE_VLOG_DEP),)
$(TARGET)/$(notdir $(GATE_VLOG_DEP)): HDL_LIB=work
endif
endif
# 
# Specify additional HDL source compilation options if any
# 
# Specify top design unit for HDL source

# Specify top design unit

ifneq "$(RTLTOOL)" ""
# ===================================================
# Include makefile for RTL synthesis
include $(MGC_HOME)/shared/include/mkfiles/ccs_$(RTLTOOL).mk
else
# ===================================================
# Include makefile for simulator
include $(MGC_HOME)/shared/include/mkfiles/ccs_$(SIMTOOL).mk
endif

