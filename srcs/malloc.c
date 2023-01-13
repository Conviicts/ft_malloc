#define _GNU_SOURCE
#include "malloc.h"

void	*malloc(size_t __size) {
	(void)__size;
	void	*ptr;

	ptr = NULL;
	return (ptr);
}
