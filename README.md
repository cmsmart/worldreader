# The Reader's Journey

### Set up

``` rails db:create ```

``` rails db:migrate ```

### Configure

``` rails db:seed ```

* note that each section in the seeds file needs to be run in order and they are dependent on each other.

* images related to the seeds (for regions and books) are not set in the seed.db and will need to be uploaded individually. They can be found in an upload folder in assets/images/uploads

### To use

* Register and sign in using the link in the navigation bar. 
* To register as a publisher the user needs to submit an email form. 
* Roles can be set on user accounts - user, publisher, banned or admin.