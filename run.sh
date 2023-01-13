make re
gcc test.c -I ./includes -o test
LD_PRELOAD=./libft_malloc.so ./test