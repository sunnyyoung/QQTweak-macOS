FILEPATH=/Applications/QQ.app/Contents/MacOS
FILENAME=QQ
TWEAKFILE=QQTweak.m
DYLIBFILE=QQTweak.dylib

build::
	clang -dynamiclib ./${TWEAKFILE} -fobjc-link-runtime -current_version 1.0 -compatibility_version 1.0 -o ./${DYLIBFILE}

debug::
	make clean
	make build
	DYLD_INSERT_LIBRARIES=./${DYLIBFILE} ${FILEPATH}/${FILENAME} &

install::
	@if ! [[ $EUID -eq 0 ]]; then\
    	echo "This script should be run using sudo or as the root user.";\
    	exit 1;\
	fi
	@if ! [ -f "${FILEPATH}/${FILENAME}" ]; then\
		echo "Can not find the ${FILENAME}.";\
		exit 1;\
	fi
	@if ! [ -f "./${DYLIBFILE}" ]; then\
		echo "Can not find the dylib file, please build first.";\
		exit 1;\
	fi

	@cp ${FILEPATH}/${FILENAME} ${FILEPATH}/${FILENAME}.bak;
	@cp ./${DYLIBFILE} ${FILEPATH}/${DYLIBFILE};
	@./insert_dylib @executable_path/${DYLIBFILE} ${FILEPATH}/${FILENAME} ${FILEPATH}/${FILENAME} --all-yes;
	@echo "Install successed!";

uninstall::
	@if ! [[ $EUID -eq 0 ]]; then\
    	echo "This script should be run using sudo or as the root user.";\
    	exit 1;\
	fi
	@if ! [ -f "${FILEPATH}/${FILENAME}" ]; then\
		echo "Can not find the ${FILENAME}.";\
		exit 1;\
	fi
	@if ! [ -f "${FILEPATH}/${FILENAME}.bak" ]; then\
		echo "Can not find the ${FILENAME} backup file.";\
		exit 1;\
	fi

	@rm -rf ${FILEPATH}/${DYLIBFILE};
	@mv ${FILEPATH}/${FILENAME}.bak ${FILEPATH}/${FILENAME};
	@echo "Uninstall successed";

clean::
	rm -rf ./${DYLIBFILE}
