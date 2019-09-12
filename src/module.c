#include <linux/init.h>
#include <linux/module.h>
#include <linux/printk.h>

#include <p5/dkmshello.h>

#define P5_DKMSHELLO_LICENSE "GPL"

MODULE_AUTHOR(P5_DKMSHELLO_MODULE_AUTHOR);
MODULE_VERSION(P5_DKMSHELLO_MODULE_VERSION);
MODULE_LICENSE(P5_DKMSHELLO_MODULE_LICENSE);
MODULE_DESCRIPTION(P5_DKMSHELLO_MODULE_DESCRIPTION);

#ifdef pr_fmt
#undef pr_fmt
#endif /* defined pr_fmt */
#define pr_fmt(fmt)  P5_DKMSHELLO_MODULE_NAME ": " fmt

static int __init p5_dkmshello_module_init(void) {
  pr_info(P5_DKMSHELLO_INIT_MESSAGE "\n");
  return 0;
}

static void __exit p5_dkmshello_module_exit(void) {
  pr_info(P5_DKMSHELLO_EXIT_MESSAGE "\n");
}

module_init(p5_dkmshello_module_init);
module_exit(p5_dkmshello_module_exit);
