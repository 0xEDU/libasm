NAME = libasm.a

PATH_SRCS = ./srcs/
PATH_OBJS = ./objects/

LIB_SRCS =	ft_strlen.s
LIB_OBJS = $(patsubst %.s,$(PATH_OBJS)%.o,$(LIB_SRCS))

TEST_MAIN = ./tests/test_main.c

FLAGS = -f elf64

all: $(NAME)

run: fclean $(NAME) $(TEST_MAIN)
	@gcc -Wall -Wextra -Werror $(TEST_MAIN) -I./includes/libasm.h $(NAME) -o test
	@./test
	@rm -rf ./test

$(NAME): $(LIB_OBJS)
	@ar rcs $(NAME) $(LIB_OBJS)

$(PATH_OBJS)%.o: $(PATH_SRCS)%.s
	@mkdir -p $(PATH_OBJS)
	@nasm $(FLAGS) $< -o $@
	@echo "\033[1;92m[SUCCESS] Object $@ created!\033[0m"

clean:
	@rm -rf $(PATH_OBJS)
	@echo "\33[1;93m[SUCCESS] Objects removed!\33[0m"

fclean: clean
	@rm -f $(NAME)
	@echo "\033[1;93m[SUCCESS] Full clean done!\33[0m"

re: fclean all
	
.PHONY: all clean fclean re
