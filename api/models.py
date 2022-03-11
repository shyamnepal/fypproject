from django.db import models
import uuid

class Signup(models.Model):
    firstName = models.CharField(max_length=50, null=False, blank=False)
    lastName = models.CharField(max_length=50, null=False, blank=False)
    email = models.CharField(max_length=50, null=False, blank=False)
    password = models.CharField(max_length=50, null=False, blank=False)

    def __str__(self):
        return self.firstName

class profile(models.Model):
    def namefile(instance, filename):
        return  '/'.join(['images',str(instance.name),filename])
    name=models.CharField(max_length=200)
    picture=models.ImageField(upload_to=namefile, blank=True)
    def __str__(self):
        return  self.name


class Hotels(models.Model):

    hotelID=models.AutoField(primary_key=True,editable=False)
    hotelName=models.CharField(max_length=60, null=False, blank=False)
    zipCode=models.IntegerField( null=False, blank=False)
    city=models.CharField(max_length=30, null=False, blank=False)
    state = models.CharField(max_length=30, null=False, blank=False)
    hotel_location = models.CharField(max_length=30, null=False, blank=False)

    def __str__(self):
        return self.hotelName


class Rooms_info(models.Model):
    def namefile(instance, filename):
        return '/'.join(['images', str(instance.room_number), filename])
    room_number =models.AutoField(primary_key=True,editable=False)
    room_type = models.CharField(max_length=60, null=False, blank=False)
    room_price = models.FloatField(max_length=200, null=False, blank=False)
    number_of_beds = models.IntegerField( null=False, blank=False)
    hotelID=models.ForeignKey(Hotels,null=True,on_delete=models.CASCADE)
    roomImage=models.ImageField(upload_to=namefile, blank=True)



