#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-compilation.mk)" "nbproject/Makefile-local-compilation.mk"
include nbproject/Makefile-local-compilation.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=compilation
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/waterlock.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/waterlock.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=/usr/lib/avr/custom/lib_eeprom.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1135764233/lib_eeprom.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1135764233/lib_eeprom.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1135764233/lib_eeprom.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=/usr/lib/avr/custom/lib_eeprom.c main.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-compilation.mk dist/${CND_CONF}/${IMAGE_TYPE}/waterlock.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega8
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1135764233/lib_eeprom.o: /usr/lib/avr/custom/lib_eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1135764233" 
	@${RM} ${OBJECTDIR}/_ext/1135764233/lib_eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1135764233/lib_eeprom.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega8  -I "/opt/microchip/mplabx/v5.05/packs/Atmel/ATmega_DFP/1.2.258/include"  -B "/opt/microchip/mplabx/v5.05/packs/Atmel/ATmega_DFP/1.2.258/gcc/dev/atmega8" -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"/usr/lib/avr/custom/" -funsigned-char -funsigned-bitfields -Os -ffunction-sections -fdata-sections -fpack-struct -fshort-enums  -I "/usr/lib/avr/custom" -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1135764233/lib_eeprom.o.d" -MT "${OBJECTDIR}/_ext/1135764233/lib_eeprom.o.d" -MT ${OBJECTDIR}/_ext/1135764233/lib_eeprom.o  -o ${OBJECTDIR}/_ext/1135764233/lib_eeprom.o /usr/lib/avr/custom/lib_eeprom.c  -DXPRJ_compilation=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega8  -I "/opt/microchip/mplabx/v5.05/packs/Atmel/ATmega_DFP/1.2.258/include"  -B "/opt/microchip/mplabx/v5.05/packs/Atmel/ATmega_DFP/1.2.258/gcc/dev/atmega8" -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"/usr/lib/avr/custom/" -funsigned-char -funsigned-bitfields -Os -ffunction-sections -fdata-sections -fpack-struct -fshort-enums  -I "/usr/lib/avr/custom" -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_compilation=$(CND_CONF)  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/_ext/1135764233/lib_eeprom.o: /usr/lib/avr/custom/lib_eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1135764233" 
	@${RM} ${OBJECTDIR}/_ext/1135764233/lib_eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1135764233/lib_eeprom.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega8  -I "/opt/microchip/mplabx/v5.05/packs/Atmel/ATmega_DFP/1.2.258/include"  -B "/opt/microchip/mplabx/v5.05/packs/Atmel/ATmega_DFP/1.2.258/gcc/dev/atmega8"  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"/usr/lib/avr/custom/" -funsigned-char -funsigned-bitfields -Os -ffunction-sections -fdata-sections -fpack-struct -fshort-enums  -I "/usr/lib/avr/custom" -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1135764233/lib_eeprom.o.d" -MT "${OBJECTDIR}/_ext/1135764233/lib_eeprom.o.d" -MT ${OBJECTDIR}/_ext/1135764233/lib_eeprom.o  -o ${OBJECTDIR}/_ext/1135764233/lib_eeprom.o /usr/lib/avr/custom/lib_eeprom.c  -DXPRJ_compilation=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega8  -I "/opt/microchip/mplabx/v5.05/packs/Atmel/ATmega_DFP/1.2.258/include"  -B "/opt/microchip/mplabx/v5.05/packs/Atmel/ATmega_DFP/1.2.258/gcc/dev/atmega8"  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"/usr/lib/avr/custom/" -funsigned-char -funsigned-bitfields -Os -ffunction-sections -fdata-sections -fpack-struct -fshort-enums  -I "/usr/lib/avr/custom" -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_compilation=$(CND_CONF)  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/waterlock.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    /usr/lib/avr/custom/lib_eeprom.c
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega8  -B "/opt/microchip/mplabx/v5.05/packs/Atmel/ATmega_DFP/1.2.258/gcc/dev/atmega8"  -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/waterlock.X.${IMAGE_TYPE}.map"  -o dist/${CND_CONF}/${IMAGE_TYPE}/waterlock.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_compilation=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1  -L"/usr/lib/avr/custom" -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/waterlock.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   /usr/lib/avr/custom/lib_eeprom.c
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega8  -B "/opt/microchip/mplabx/v5.05/packs/Atmel/ATmega_DFP/1.2.258/gcc/dev/atmega8"  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/waterlock.X.${IMAGE_TYPE}.map"  -o dist/${CND_CONF}/${IMAGE_TYPE}/waterlock.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_compilation=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)  -L"/usr/lib/avr/custom" -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}/avr-objcopy -O ihex "dist/${CND_CONF}/${IMAGE_TYPE}/waterlock.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/waterlock.X.${IMAGE_TYPE}.hex"
	
	
	
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/compilation
	${RM} -r dist/compilation

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
