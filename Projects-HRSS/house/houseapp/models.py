from django.db import models
from django.contrib.auth.models import User
from ckeditor.fields import RichTextField
from django.utils import timezone
# Create your models here.
    
class HouseType(models.Model):
    category = models.CharField(max_length=200, null=True, blank=True,) 
    
    def __str__(self):
        return self.category



class House(models.Model):
    PURPOSE = (
        ('For Rent','For Rent'),
        ('For Sale','For Sale'),
        )
    STATUS = (
        ('full', 'full'),
        ('sold out', 'sold out'),
        ('pending', 'pending'),
    )
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    owner = models.CharField(max_length=200,null=True)
    number = models.CharField(max_length=200, null=True)
    category = models.ForeignKey(HouseType, on_delete=models.CASCADE)
    location = models.CharField(max_length=200, null=True)
    price = models.FloatField(null=True, blank=True)
    rooms = models.CharField(max_length=200, null=True)
    image = models.ImageField(blank=True, null=True)
    video = models.FileField(upload_to='images/%y',default=None)
    status = models.CharField(max_length=200, null=True, blank=True, choices=STATUS, default='pending')
    purpose = models.CharField(max_length=200, null=True, choices=PURPOSE,default='For Rent')

    def __str__(self):
        return self.owner
    
    
class Chatroom(models.Model):
    chattitle = models.TextField(max_length=200, null=True,blank=True)

    def __str__(self):
        return self.chattitle
    
    
#chat model   
class TenantMessage(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    tenant = models.ForeignKey(User, related_name='messages', on_delete=models.CASCADE,default=None)
    timestamp = models.DateTimeField(default=timezone.now)
    content = models.TextField()

    def __str__(self):
        return self.content

class OwnerMessage(models.Model):
    tenant = models.ForeignKey(User, on_delete=models.CASCADE)
    owner = models.ForeignKey(User, related_name='sent_messages', on_delete=models.CASCADE,default=None)
    timestamp = models.DateTimeField(default=timezone.now)
    content = models.TextField() 

    def __str__(self):
        return self.content   
#end chat model   

   
class Feedback(models.Model):
    feedback = models.TextField()

    def __str__(self):
        return self.feedback
    

class House_location(models.Model):
    location_name = models.CharField(max_length=200, blank=False, null=False)
    date = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.location_name

class Agents(models.Model):
    caption = models.CharField(max_length=50,blank=True,null=False)
    picture = models.ImageField(blank=True,null=True)

    def __str__(self):
        return self.caption