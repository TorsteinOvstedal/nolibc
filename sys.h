#ifndef SYS_H
#define SYS_H

#define STDIN  0
#define STDOUT 1
#define STDERR 2

/**
 * Invokes the specified system call.
 * Supports up to 6 system call arguments.
 */
extern long system(long number, ...);

/**
 * Terminates the current process.
 */
extern void exit(int code);

/**
 * Writes buffer to file descriptor.
 */
extern long write(int fd, const void* buffer, unsigned long size);

#endif
