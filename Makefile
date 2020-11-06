NAME = libasm.a

SRCS = ft_strdup.s ft_strcpy.s ft_strlen.s ft_read.s\
ft_write.s ft_strcmp.s\

OBJECTS = $(SRCS:.s=.o)

all: $(NAME)

$(NAME): $(OBJECTS)
	@echo "compile main part"
	@ar rc $(NAME) $(OBJECTS)
	@ranlib $(NAME)

%.o: %.s
	@nasm -f macho64 $<

clean:
	@echo "clean .o files"
	@/bin/rm -f *.o

fclean: clean
	@echo "clean library file"
	@/bin/rm -f $(NAME)

re: fclean all
	@echo "remaking library"

.PHONY: all clean fclean re