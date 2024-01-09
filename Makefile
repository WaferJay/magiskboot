CC = gcc
AR = ar

LIBLZMA_INCLUDES = \
	-Ixz_config \
    -Ixz/src/common \
    -Ixz/src/liblzma/api \
    -Ixz/src/liblzma/check \
    -Ixz/src/liblzma/common \
    -Ixz/src/liblzma/delta \
    -Ixz/src/liblzma/lz \
    -Ixz/src/liblzma/lzma \
    -Ixz/src/liblzma/rangecoder \
    -Ixz/src/liblzma/simple \
    -Ixz/src/liblzma

INC = -Imincrypt/include -Iutils/include -Ilibfdt/include -Ibzip2 $(LIBLZMA_INCLUDES)
CFLAGS = -ffunction-sections -O3 $(INC)
LDFLAGS = -W

OBJECTS = cpio.o main.o bootimg.o hexpatch.o compress.o format.o dtb.o ramdisk.o pattern.o

LIBLZMA_CFLAGS = -DHAVE_VISIBILITY -DHAVE_CONFIG_H -Wno-implicit-function-declaration -ffunction-sections -O3 

LIBLZMA_DIRS = \
    xz/src/common \
    xz/src/liblzma/check \
    xz/src/liblzma/common \
    xz/src/liblzma/delta \
    xz/src/liblzma/lz \
    xz/src/liblzma/lzma \
    xz/src/liblzma/rangecoder \
    xz/src/liblzma/simple

LIBLZMA_SRCS = \
    xz/src/common/tuklib_cpucores.c \
    xz/src/common/tuklib_exit.c \
    xz/src/common/tuklib_mbstr_fw.c \
    xz/src/common/tuklib_mbstr_width.c \
    xz/src/common/tuklib_open_stdxxx.c \
    xz/src/common/tuklib_physmem.c \
    xz/src/common/tuklib_progname.c \
    xz/src/liblzma/check/check.c \
    xz/src/liblzma/check/crc32_fast.c \
    xz/src/liblzma/check/crc32_table.c \
    xz/src/liblzma/check/crc64_fast.c \
    xz/src/liblzma/check/crc64_table.c \
    xz/src/liblzma/check/sha256.c \
    xz/src/liblzma/common/alone_decoder.c \
    xz/src/liblzma/common/alone_encoder.c \
    xz/src/liblzma/common/auto_decoder.c \
    xz/src/liblzma/common/block_buffer_decoder.c \
    xz/src/liblzma/common/block_buffer_encoder.c \
    xz/src/liblzma/common/block_decoder.c \
    xz/src/liblzma/common/block_encoder.c \
    xz/src/liblzma/common/block_header_decoder.c \
    xz/src/liblzma/common/block_header_encoder.c \
    xz/src/liblzma/common/block_util.c \
    xz/src/liblzma/common/common.c \
    xz/src/liblzma/common/easy_buffer_encoder.c \
    xz/src/liblzma/common/easy_decoder_memusage.c \
    xz/src/liblzma/common/easy_encoder.c \
    xz/src/liblzma/common/easy_encoder_memusage.c \
    xz/src/liblzma/common/easy_preset.c \
    xz/src/liblzma/common/filter_buffer_decoder.c \
    xz/src/liblzma/common/filter_buffer_encoder.c \
    xz/src/liblzma/common/filter_common.c \
    xz/src/liblzma/common/filter_decoder.c \
    xz/src/liblzma/common/filter_encoder.c \
    xz/src/liblzma/common/filter_flags_decoder.c \
    xz/src/liblzma/common/filter_flags_encoder.c \
    xz/src/liblzma/common/hardware_cputhreads.c \
    xz/src/liblzma/common/hardware_physmem.c \
    xz/src/liblzma/common/index.c \
    xz/src/liblzma/common/index_decoder.c \
    xz/src/liblzma/common/index_encoder.c \
    xz/src/liblzma/common/index_hash.c \
    xz/src/liblzma/common/outqueue.c \
    xz/src/liblzma/common/stream_buffer_decoder.c \
    xz/src/liblzma/common/stream_buffer_encoder.c \
    xz/src/liblzma/common/stream_decoder.c \
    xz/src/liblzma/common/stream_encoder.c \
    xz/src/liblzma/common/stream_encoder_mt.c \
    xz/src/liblzma/common/stream_flags_common.c \
    xz/src/liblzma/common/stream_flags_decoder.c \
    xz/src/liblzma/common/stream_flags_encoder.c \
    xz/src/liblzma/common/vli_decoder.c \
    xz/src/liblzma/common/vli_encoder.c \
    xz/src/liblzma/common/vli_size.c \
    xz/src/liblzma/delta/delta_common.c \
    xz/src/liblzma/delta/delta_decoder.c \
    xz/src/liblzma/delta/delta_encoder.c \
    xz/src/liblzma/lz/lz_decoder.c \
    xz/src/liblzma/lz/lz_encoder.c \
    xz/src/liblzma/lz/lz_encoder_mf.c \
    xz/src/liblzma/lzma/fastpos_table.c \
    xz/src/liblzma/lzma/fastpos_tablegen.c \
    xz/src/liblzma/lzma/lzma2_decoder.c \
    xz/src/liblzma/lzma/lzma2_encoder.c \
    xz/src/liblzma/lzma/lzma_decoder.c \
    xz/src/liblzma/lzma/lzma_encoder.c \
    xz/src/liblzma/lzma/lzma_encoder_optimum_fast.c \
    xz/src/liblzma/lzma/lzma_encoder_optimum_normal.c \
    xz/src/liblzma/lzma/lzma_encoder_presets.c \
    xz/src/liblzma/rangecoder/price_table.c \
    xz/src/liblzma/rangecoder/price_tablegen.c \
    xz/src/liblzma/simple/arm.c \
    xz/src/liblzma/simple/armthumb.c \
    xz/src/liblzma/simple/ia64.c \
    xz/src/liblzma/simple/powerpc.c \
    xz/src/liblzma/simple/simple_coder.c \
    xz/src/liblzma/simple/simple_decoder.c \
    xz/src/liblzma/simple/simple_encoder.c \
    xz/src/liblzma/simple/sparc.c \
    xz/src/liblzma/simple/x86.c

LIBLZMA_OBJS = \
    xz/src/common/tuklib_cpucores.o \
    xz/src/common/tuklib_exit.o \
    xz/src/common/tuklib_mbstr_fw.o \
    xz/src/common/tuklib_mbstr_width.o \
    xz/src/common/tuklib_open_stdxxx.o \
    xz/src/common/tuklib_physmem.o \
    xz/src/common/tuklib_progname.o \
    xz/src/liblzma/check/check.o \
    xz/src/liblzma/check/crc32_fast.o \
    xz/src/liblzma/check/crc32_table.o \
    xz/src/liblzma/check/crc64_fast.o \
    xz/src/liblzma/check/crc64_table.o \
    xz/src/liblzma/check/sha256.o \
    xz/src/liblzma/common/alone_decoder.o \
    xz/src/liblzma/common/alone_encoder.o \
    xz/src/liblzma/common/auto_decoder.o \
    xz/src/liblzma/common/block_buffer_decoder.o \
    xz/src/liblzma/common/block_buffer_encoder.o \
    xz/src/liblzma/common/block_decoder.o \
    xz/src/liblzma/common/block_encoder.o \
    xz/src/liblzma/common/block_header_decoder.o \
    xz/src/liblzma/common/block_header_encoder.o \
    xz/src/liblzma/common/block_util.o \
    xz/src/liblzma/common/common.o \
    xz/src/liblzma/common/easy_buffer_encoder.o \
    xz/src/liblzma/common/easy_decoder_memusage.o \
    xz/src/liblzma/common/easy_encoder.o \
    xz/src/liblzma/common/easy_encoder_memusage.o \
    xz/src/liblzma/common/easy_preset.o \
    xz/src/liblzma/common/filter_buffer_decoder.o \
    xz/src/liblzma/common/filter_buffer_encoder.o \
    xz/src/liblzma/common/filter_common.o \
    xz/src/liblzma/common/filter_decoder.o \
    xz/src/liblzma/common/filter_encoder.o \
    xz/src/liblzma/common/filter_flags_decoder.o \
    xz/src/liblzma/common/filter_flags_encoder.o \
    xz/src/liblzma/common/hardware_cputhreads.o \
    xz/src/liblzma/common/hardware_physmem.o \
    xz/src/liblzma/common/index.o \
    xz/src/liblzma/common/index_decoder.o \
    xz/src/liblzma/common/index_encoder.o \
    xz/src/liblzma/common/index_hash.o \
    xz/src/liblzma/common/outqueue.o \
    xz/src/liblzma/common/stream_buffer_decoder.o \
    xz/src/liblzma/common/stream_buffer_encoder.o \
    xz/src/liblzma/common/stream_decoder.o \
    xz/src/liblzma/common/stream_encoder.o \
    xz/src/liblzma/common/stream_encoder_mt.o \
    xz/src/liblzma/common/stream_flags_common.o \
    xz/src/liblzma/common/stream_flags_decoder.o \
    xz/src/liblzma/common/stream_flags_encoder.o \
    xz/src/liblzma/common/vli_decoder.o \
    xz/src/liblzma/common/vli_encoder.o \
    xz/src/liblzma/common/vli_size.o \
    xz/src/liblzma/delta/delta_common.o \
    xz/src/liblzma/delta/delta_decoder.o \
    xz/src/liblzma/delta/delta_encoder.o \
    xz/src/liblzma/lz/lz_decoder.o \
    xz/src/liblzma/lz/lz_encoder.o \
    xz/src/liblzma/lz/lz_encoder_mf.o \
    xz/src/liblzma/lzma/fastpos_table.o \
    xz/src/liblzma/lzma/fastpos_tablegen.o \
    xz/src/liblzma/lzma/lzma2_decoder.o \
    xz/src/liblzma/lzma/lzma2_encoder.o \
    xz/src/liblzma/lzma/lzma_decoder.o \
    xz/src/liblzma/lzma/lzma_encoder.o \
    xz/src/liblzma/lzma/lzma_encoder_optimum_fast.o \
    xz/src/liblzma/lzma/lzma_encoder_optimum_normal.o \
    xz/src/liblzma/lzma/lzma_encoder_presets.o \
    xz/src/liblzma/rangecoder/price_table.o \
    xz/src/liblzma/rangecoder/price_tablegen.o \
    xz/src/liblzma/simple/arm.o \
    xz/src/liblzma/simple/armthumb.o \
    xz/src/liblzma/simple/ia64.o \
    xz/src/liblzma/simple/powerpc.o \
    xz/src/liblzma/simple/simple_coder.o \
    xz/src/liblzma/simple/simple_decoder.o \
    xz/src/liblzma/simple/simple_encoder.o \
    xz/src/liblzma/simple/sparc.o \
    xz/src/liblzma/simple/x86.o

all:libmincrypt.a libutils.a libfdt.a libbz2.a magiskboot

libbz2.a:
	make -C bzip2

libfdt.a:
	make -C libfdt

libutils.a:
	make -C utils

libmincrypt.a:
	make -C mincrypt

magiskboot: $(OBJECTS) liblzma.a Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -Lmincrypt -Lutils -Llibfdt -lmincrypt -lutils -lfdt -lz -L. -llzma -llz4 -Lbzip2 -lbz2 -lpthread -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

xz/src/common/%.o: xz/src/common/%.c
	$(CC) -c $(LIBLZMA_INCLUDES) $(LIBLZMA_CFLAGS) $< -o $@ 
xz/src/liblzma/check/%.o: xz/src/liblzma/check/%.c
	$(CC) -c $(LIBLZMA_INCLUDES) $(LIBLZMA_CFLAGS) $< -o $@ 
xz/src/liblzma/common/%.o: xz/src/liblzma/common/%.c
	$(CC) -c $(LIBLZMA_INCLUDES) $(LIBLZMA_CFLAGS) $< -o $@ 
xz/src/liblzma/delta/%.o: xz/src/liblzma/delta/%.c
	$(CC) -c $(LIBLZMA_INCLUDES) $(LIBLZMA_CFLAGS) $< -o $@ 
xz/src/liblzma/lz/%.o: xz/src/liblzma/lz/%.c
	$(CC) -c $(LIBLZMA_INCLUDES) $(LIBLZMA_CFLAGS) $< -o $@ 
xz/src/liblzma/lzma/%.o: xz/src/liblzma/lzma/%.c
	$(CC) -c $(LIBLZMA_INCLUDES) $(LIBLZMA_CFLAGS) $< -o $@ 
xz/src/liblzma/rangecoder/%.o: xz/src/liblzma/rangecoder/%.c
	$(CC) -c $(LIBLZMA_INCLUDES) $(LIBLZMA_CFLAGS) $< -o $@ 
xz/src/liblzma/simple/%.o: xz/src/liblzma/simple/%.c
	$(CC) -c $(LIBLZMA_INCLUDES) $(LIBLZMA_CFLAGS) $< -o $@ 

liblzma.a: $(LIBLZMA_OBJS)
	$(AR) -r $@ $^

clean:
	rm -f *.o
	rm -f magiskboot
	make -C utils clean
	make -C libfdt clean
	make -C mincrypt clean
	rm -f $(LIBLZMA_OBJS)

