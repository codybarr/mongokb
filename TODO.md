* Fields: Title, KBA#, Keywords, Content, Revision Notes, timestamps

# Features

* Test out mongodb text searching (fuzzy)
  * Test on 20K records; find a better forgery generator for article content
* Add ability to add attachments to articles (paperclip/carrierwave)
* WYSIWYG (http://volmerius.com/bootsy/)
* Need to implement workflow process for articles (ability to create new articles and save as drafts, new revisions which remain as drafts, then can be published)
  * Add https://github.com/airblade/paper_trail for version control (have to use mongo paper trail)
* Add admin section where KE can review pending drafts (can filter by own/all), agent comments.
* Add user registration
  * Favorites
  * Search Favorites
  * ACL (tech, ke)
    * techs can add comments to scripts which can be reviewed by kes (marked as accepted, rejected)
    * kes can do everything, including reverting to prior versions
    * managers can add articles to the "recommended reading" section of the homepage
