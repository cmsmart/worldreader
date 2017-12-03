# The Reader's Journey

### Set up

``` rails db:create ```

``` rails db:migrate ```

### Configure

``` rails db:seed ```

#### Keys required in environment variables

##### amazon s3
* S3_ACCESS_KEY_ID
* S3_SECRET_ACCESS_KEY
* S3_REGION
* S3_BUCKET

##### goodreads
* GOODREADS_KEY

##### custom devise key
* DEVISE_KEY

##### mailgun
* MAILGUN_API_KEY 
* MAILGUN_DOMAIN
* REGISTRATION_EMAIL

##### stripe
* PUBLISHABLE_KEY
* SECRET_KEY

##### algolia search
* ALGOLIA_ID
* ALGOLIA_KEY

### Note

Each section in the seeds file needs to be run in order and they are dependent on each other.

Images related to the seeds (for regions and books) are not set in the seed.db and will need to be uploaded individually. They can be found in an upload folder in assets/images/uploads

### To use

* Register and sign in using the link in the navigation bar. 
* To register as a publisher the user needs to submit an email form. 
* Roles can be set on user accounts -> user, publisher, banned or admin.