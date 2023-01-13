ifeq ($(HOSTTYPE),)
	HOSTTYPE := $(shell uname -m)_$(shell uname -s)
endif

NAME		= libft_malloc.so
LIB			= libft_malloc_$(HOSTTYPE).so

SRCS		= srcs/
INCS		= includes/
LIBFT_INC	= libft/

CC			= gcc
CFLAGS		= -Wall -Wextra -Werror $(INCS2) -g -shared -fPIC
LIBS		= -L ./libft/ -lft

INCS2	= -I $(INCS) -I $(LIBFT_INC)

SRC			= malloc.c

OBJS		= $(addprefix $(SRCS), $(SRC:.c=.o))

all: $(NAME)

libft/%:
	make -C libft

$(LIB): $(OBJS) $(DEP) libft/libft.a
	$(CC) $(CFLAGS) $(LIBS) -o $@ $(OBJS)

$(NAME): $(LIB)
	ln -fs $(LIB) $(NAME)

clean:
	make -C ./libft clean
	rm -f $(OBJS)
.PHONY: clean

fclean: clean
	make -C ./libft fclean
	rm -f $(NAME)
.PHONY: fclean


re: fclean all
.PHONY: re