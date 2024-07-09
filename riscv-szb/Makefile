SOCBIN ?= ysyxSoC/flash/hello-flash.bin


soc-test: prepare
	./build.sh -e soc -b -s -y -v '--timescale "1ns/1ns" -Wno-fatal' -a "-i ysyxSoC/loader/hello-riscv64-mycpu.bin"

soc-test-dump: prepare
	./build.sh -e soc -b -s -y -v '--timescale "1ns/1ns" -Wno-fatal' -a "-i ysyxSoC/loader/hello-riscv64-mycpu.bin --dump-wave -b $(START) -e $(END)"

soc-test1: prepare
	./build.sh -e soc -b -s -y -v '--timescale "1ns/1ns" -Wno-fatal' -a "-i ysyxSoC/loader/hello-loader.bin"
soc-test2: prepare
	./build.sh -e soc -b -s -y -v '--timescale "1ns/1ns" -Wno-fatal' -a "-i ysyxSoC/loader/memtest-loader.bin"
soc-test3: prepare
	./build.sh -e soc -b -s -y -v '--timescale "1ns/1ns" -Wno-fatal' -a "-i ysyxSoC/loader/rtthread-loader.bin"

submit: prepare
	./submit.sh


prepare:
	cp ~/p1_2021ysyx/code/oscpu/projects/soc/vsrc/ysyx_210544.v projects/soc/vsrc/

.PHONY: test1 test2 submit
