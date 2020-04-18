from social import models


def populate():
    # Populate Interest table
    models.Interest.objects.create(label="cooking")
    models.Interest.objects.create(label="running")
    models.Interest.objects.create(label="cycling")
    models.Interest.objects.create(label="basketball")
    models.Interest.objects.create(label="reading")
    models.Interest.objects.create(label="writing")

    # Populate UserInfo
    T1 = models.UserInfo.objects.create_user_info(
        username="TestUser1", password="1234")
    T1.save()
    T2 = models.UserInfo.objects.create_user_info(
        username="TestUser2", password="1234")
    T2.save()
    T3 = models.UserInfo.objects.create_user_info(
        username="TestUser3", password="1234")
    T3.save()
    T4 = models.UserInfo.objects.create_user_info(
        username="TestUser4", password="1234")
    T4.save()
    T5 = models.UserInfo.objects.create_user_info(
        username="TestUser5", password="1234")
    T5.save()
    T6 = models.UserInfo.objects.create_user_info(
        username="TestUser6", password="1234")
    T6.save()

    # Populate Post table
    models.Post.objects.create(owner=T1, content="Hi I am TestUser1")
    models.Post.objects.create(owner=T2, content="Hi I am TestUser2")
    models.Post.objects.create(owner=T3, content="Hi I am TestUser3")
    models.Post.objects.create(owner=T4, content="Hi I am TestUser4")
    models.Post.objects.create(owner=T5, content="Hi I am TestUser5")
    models.Post.objects.create(owner=T6, content="Hi I am TestUser6")

    # Populate FriendRequest table
    models.FriendRequest.objects.create(to_user=T1, from_user=T2)
    models.FriendRequest.objects.create(to_user=T2, from_user=T3)
    models.FriendRequest.objects.create(to_user=T3, from_user=T4)
    models.FriendRequest.objects.create(to_user=T4, from_user=T5)
    models.FriendRequest.objects.create(to_user=T6, from_user=T1)
    models.FriendRequest.objects.create(to_user=T1, from_user=T3)
