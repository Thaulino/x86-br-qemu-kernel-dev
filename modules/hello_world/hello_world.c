/* Kernel Programming */


#include <linux/module.h>      /* Needed by all modules */
#include <linux/kernel.h>      /* Needed for KERN_ALERT */
#include <linux/init.h>        /* Needed for the macros */

static int hello_data __initdata = 3;


static int __init hello_init(void)
{
   printk(KERN_ALERT "Hello, world %d\n", hello_data);
   return 0;
}


static void __exit hello_exit(void)
{
   printk(KERN_ALERT "Goodbye, world 3\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");