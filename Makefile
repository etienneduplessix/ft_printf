# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edupless <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/13 17:00:21 by edupless          #+#    #+#              #
#    Updated: 2023/03/13 17:00:25 by edupless         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME		= libftprintf.a
INCLUDE		= include/
LIBFT		= libft
SRC_DIR		= src/
OBJ_DIR		= obj/
CC			= cc
CFLAGS		= -Wall -Werror -Wextra -I
RM			= rm -f
AR			= ar rcs



SRC_FILES	=	ft_printf ft_printf_utils ft_print_ptr ft_print_unsigned ft_print_hex


SRC 		= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_FILES)))
OBJ 		= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_FILES)))


all:		$(NAME)

$(NAME):	$(OBJ_DIR) $(OBJ)
			@ make -C $(LIBFT)
			@ cp libft/libft.a .
			@ mv libft.a $(NAME)
			@ $(AR) $(NAME) $(OBJ)
			
$(OBJ_DIR):
			@ mkdir -p $(OBJ_DIR)	
		
$(OBJ_DIR)%.o: $(SRC_DIR)%.c | $(OBJF)
			@ $(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

clean:
			@ $(RM) -rf $(OBJ_DIR)
			@ make clean -C $(LIBFT)

fclean:		clean
			@ $(RM) -f $(NAME)
			@ $(RM) -f $(LIBFT)/libft.a
			
re:			fclean all

.PHONY:		all clean fclean re norm
