# CS 1XA3 Project03 - Singj36



## Installation

If you have [conda](https://docs.conda.io/en/latest/) installed on your local machine you could skip to the Usage section else follow the required steps to successfully [install conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/) on your machine.

Once Conda is successfully downloaded you should run the command to create a djangoenv in conda:

```bash
conda create -n djangoenv python=3.7 
```
You can check if the environment is downloaded by running the following command in your terminal:

```bash
conda info --envs 
```
and you will see something like this:

```bash
# conda environments:
#
                         /Users/japnitsingh/opt/anaconda3/envs/djangoenv
base                  *  /opt/anaconda3 
```
## Usage

Once you have successfully installed conda on your local machine you can run the project either on the local machine or your mac1xa3.ca server:

**You should be on the project root for running this command (i.e same level as the manage.py)**

* For local machine:
```bash
python manage.py runserver localhost:8000 
```
* For the mac1xa3.ca server:

```bash
python manage.py runserver localhost:10094
```

Running these commands from your terminal  you can see the following success message and you are all set to test the webpage:
```bash
System check identified no issues (0 silenced).
April 18, 2020 - 10:14:49
Django version 3.0.3, using settings 'Project03.settings'
Starting development server at http://localhost:8000/
Quit the server with CONTROL-C.
```

You should open the required address and you will see a login/signup option:

* You can login using any of the users pre-defined in the populate_db.py file in the root of the directory 

You can initially login with the :
```bash
Username = TestUser1
Password = 1234
```
* You also have an option to signup i.e create a new account with a new username and password
## Objective 01

### Description :
* The login view is rendered by the url 'localhost:8000/e/macid/' which has a login button and a signup button.
* On pressing the **login button** the user is redirected to a login page which is displayed using login.djhtml and rendered using login_view :

```code
path('', views.login_view, name='login_view'),
```
* The login_view in login/views.py handles the POST request a user sends and the  username and password of the user. It then checks if the user is authenticated using the posted username and password
```bash
user = authenticate(request, username=username, password=password)
```
* On pressing the **signup button** the user is redirected to the signup page displayed by signup.djhtml and rendered by create_view in login/views.py:
* The create view handles the POST request for the username and password entered by the user while creating a new account: If the information is valid the and the user is authenticated the user is logged in.

```bash
form = UserCreationForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            models.UserInfo.objects.create_user_info(
                username=username, password=raw_password)
             user = authenticate(request, username=username, password=password)
```

* Once the user is logged in the user has an option to logout using the login button in the navigation bar on the top right of the social:messages view.
Once the user is successfully logged out the user is redirected to login view and it can no longer access its profile.
### Exceptions :

* If the user authentication fails in any case for whatever reason, the user is redirected to the login:login_view that is the user has to try to login again!
```code
 else:
            request.session['failed'] = True
```
* If the user is authenticated the user is redirected to 'social:messages view' rendered by the social/views.py and the page is unique for each user with their own personal information. 

* If the user information does not match or is not complete then the user is redirected to the signup view to redo the signup process again and an error message is raised to let the user know about the mismatched information!
```code
    request.session['create_failed'] = True
    return redirect('login:signup_view')
```

## Objective 02
### Description :
The left column of social:messages_view, social:account_view, social:people_view are displayed using the social_base.djhtml which shows the attributes  **name**, **location** , **employment**, **birth date** and **interests** using the following code snippet:
```html
   
  <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>{{ user_info.employment }}  </p>
  <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> {{ user_info.location }} </p>
  <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> {{ user_info.birthday }} </p>
```
where user_info is a UserInfo object declared in the views.py and sent over to the .djhtml file through the context dictionary.

The interests however being a separate model and having Interest labels as primary keys are managed in the .djhtml file using the following code snippet :
```html
{% for interest in user_info.interests.all %}
      <span class="w3-tag w3-small w3-theme-d5"> {{ interest.label }} </span>    
{% endfor %} 
    
```

### Exceptions :

* If the user is not authenticated the user is redirected to login:login_view
* If the user is authenticated then the user can see their respective fields.
* If the fields are empty then the user can see a default/"none"/"unspecified" value instead of an "empty string".
## Objective 03
### Description :
* An authenticated user can access the account settings using the nav bar avatar icon on the top right of the page

* The user at any time can have access to the following the account settings:
    * Change their password
    * Change/add their personal information attributes
* The user has an option to change their passwords using an inbuilt password change form which requires them to input their previous password and enter the new password.
* Once the password is changed the user is required to login again with their new password:
```code
    if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            return redirect('login:login_view')
```
* The user has the option to change/add information to their personal information attributes keeping the birthdate a required field using a self made update information form.
* The fields are initialized with the already stored values and the user can chose to change their existing information.
* The interests being a many to many field with labels as the primary key are checked if they exist and if not then creates a new label.

### Exceptions :
* If the user authentication fails in any case for whatever reason, the user is redirected to the login:login_view that is the user has to try to login again!
```code
 else:
            request.session['failed'] = True
```
* If the Password change form fails for any reason the user is redirected to social:messages view and the user has to try again!
* If the New Password is not same as the Confirm New Password then the user will be informed with the error message.
* If the user has nothing in the personal attributes then the fields show "none"/"unspecified" in place of an empty string
**The Birthdate is kept as an required field!** 

## Objective 04
### Description :
* Once the user is authenticated it can access the profiles of all people in the database using the peoples icon on the top left navigation bar.
* The page is displayed using the people.djhtml file and rendered using the people_view function in the social/views.py
* The people shown in the peoples page are all the people in the data base which are not friends of the user except the user itself:
 
```code
         for people in models.UserInfo.objects.exclude(user=user_info.user):

            if people not in friends:
                all_people += [people]
```
* The page initially shows one person and incrementally shows more people as the "More" button is pressed 
```code
        request.session['limit'] = request.session.get('limit', 1)
```
* The session variable is initialized in the people_view and is incremented by one as the more button is pressed which is rendered by the more_people_view function : 

```code
      request.session['limit'] = request.session['limit'] + 1
      return HttpResponse()
```


### Exceptions: 
* If the user authentication fails in any case for whatever reason, the user is redirected to the login:login_view that is the user has to try to login again!
```code
 else:
            request.session['failed'] = True
```
* The request session variable is set to 1 when the user logs out so whenever the user logs out the variable is reset and the number of people displayed are reset to 1.
* js alert pops up with the status code if the page does not load for some reason


## Objective 05
### Description :
* You can send and receive friend requests using the button beneath the person in the peoples page
* When the person hits the friend request button an instance of a friend request is formed using the link of each button with the jQuery event in people.js file under the static directory.
* The friend request button has a unique id attached to it which is specific to the user receiving the friend request.  
* The program is designed to form an instance of UserInfo to form an instance of FriendRequest model which is rendered by the function people_view and displayed by people.djhtml
```code
     username = frID[3:]
        if request.user.is_authenticated:
            username = frID[3:]
            t = models.UserInfo.objects.get(user=request.user)
            f = models.UserInfo.objects.get(user_id=username)
            f_r = models.FriendRequest.objects.create(
                                to_user=f, from_user=t)
```
### Exceptions:
* If the user authentication fails in any case for whatever reason, the user is redirected to the login:login_view that is the user has to try to login again!
```code
 else:
            request.session['failed'] = True
```

* The user can send a friend request only once.If the friend request is successfully sent once the friend request button gets disabled which does not allow the request to be sent again.
* js alert pops up with the status code if the page does not load for some reason 

## Objective 06
### Description :
* This feature enables the user to accept/decline friend requests sent to them by other users displayed by the people view on the right column rendered by the accept_decline_view
* There is a unique id attached to the accept/decline buttons which are linked with the jQuery in the accept_decline function in people.js to attach the friend request to the respective user
* The user can either accept a friend request which makes adds a friend to both the user and the user sending the friend request.
* Or the user can decline a friend request which does not add the user sending the request as a friend
* In both the cases the request instance formed by the friend_request model is deleted.
```code
            if data[0] == "D":
                r = models.FriendRequest.objects.get(
                    to_user=t, from_user=f)
                r.delete()
            elif data[0] == "A":

                req = models.FriendRequest.objects.get(
                    to_user=t, from_user=f)
                req.delete()
                t.friends.add(f)
                f.friends.add(t)

```
### Exceptions:
* If the user authentication fails in any case for whatever reason, the user is redirected to the login:login_view that is the user has to try to login again!
```code
 else:
            request.session['failed'] = True
```
* js alert pops up with the status code if the page does not load for some reason.

## Objective 07
### Description :
* This feature enables the authenticated user to see all their friends on the right column of the social:messages_view displayed by the messages.djhtml and rendered by messages view function in social/views.py
* The list includes all the friends the current user has accepted the friend requests of.
```html
{% for friend in user_info.friends.all %}
     <span>{{ friend.user }}</span>
{% endfor %}
```

### Exceptions:
* If the user authentication fails in any case for whatever reason, the user is redirected to the login:login_view that is the user has to try to login again!
```code
 else:
            request.session['failed'] = True
```
* js alert pops up with the status code if the page does not load for some reason.

## Objective 08
### Description :
* This feature renders the posts submitted by the post button in the middle column of the messages view by the user using the post view in social/views.py.
* The post button is linked to an **ajax** post request handled by the sumbitPost function in messages.js and an instance of the Post model class is made by the post_view function with its attribute owner as the user using the page
```code
user = models.UserInfo.objects.get(user=request.user)
            time = datetime.now().timestamp()
            models.Post.objects.create(
                owner=user, content=postContent, timestamp=time)
```
### Exceptions:
* If the user authentication fails in any case for whatever reason, the user is redirected to the login:login_view that is the user has to try to login again!
```code
 else:
            request.session['failed'] = True

```
* An empty content post will result in an empty post but a successful POST request.
* js alert pops up with the status code if the page does not load for some reason.

## Objective 09
### Description :
* This feature enables the user to view the posts made by the user itself and all the people in the data base that have made a post.
* The posts made by each of the user can be seen in the middle column of the page displayed by messages.djhtml rendered by post_view in social/views.py
* The posts displayed are ordered by the timestamp that is newest to oldest as compared to the time they were posted
```code
posts = list(models.Post.objects.all().order_by('-timestamp'))

```
* There is initially one post shown to the user(newest) and the user has an option to view  more posts by clicking on the more button which renders the more_post_view function that is responsible to increment the session limit by one each time the button is pressed 

```code
        request.session['limit'] = request.session.get('limit', 1)
        request.session['limit'] = request.session['limit'] + 1
        return HttpResponse()
```
### Exceptions: 
* If the user authentication fails in any case for whatever reason, the user is redirected to the login:login_view that is the user has to try to login again!
```code
 else:
            request.session['failed'] = True
```
* The request session variable is set to 1 when the user logs out so whenever the user logs out the variable is reset and the number of posts displayed are reset to 1.
* js alert pops up with the status code if the page does not load for some reason


## Objective 10
### Description :
* This objective gives the user the ability to like the posts made by other users.
* The like button has an unique id attached to it which is specific to the user of owner of the post.
* To differentiate between the different posts made by the user the likes added are specific to the post id
* Once a user likes a post, the likes of the specific post instances are increased by one.
```code
pid = int(a[2])
            user = models.UserInfo.objects.get(user=request.user)
            t = models.UserInfo.objects.get(user_id=postID)
            models.Post.objects.filter(owner=t).get(id=pid).likes.add(user)
```
where pid is the unique post-id
* A user can only like a given post once
* Once a user has liked the post the like button gets disabled to prevent multiple likes.
### Exceptions: 
* If the user authentication fails in any case for whatever reason, the user is redirected to the login:login_view that is the user has to try to login again!
```code
 else:
            request.session['failed'] = True
```
* js alert pops up with the status code if the page does not load for some reason.

## Objective 11
### Description :
* Made a populate function inside populate_db.py file in the projects root to populate the database with different instances of the different model classes made in models.py
* The instances include multiple objects for example:

model : Interest
 ```code
 models.Interest.objects.create(label="writing")
```
model : Post 
```code
 models.Post.objects.create(owner=T1, content="Hi I am TestUser1")
```
model : UserInfo 
```code
T1 = models.UserInfo.objects.create_user_info(
        username="TestUser1", password="1234")
T1.save()
```
model : FriendRequest
```code
  models.FriendRequest.objects.create(to_user=T1, from_user=T2)
```
