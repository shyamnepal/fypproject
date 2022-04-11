from audioop import reverse
from dataclasses import field
import email
import imp
from lib2to3.pgen2 import token
from urllib import request
from rest_framework import serializers

from .utils import Util
from .models import Reservation, Signup, billingInfo,profile,Hotels,Rooms_info,customer,customer_details, customer_info, rooms, service_info, services
billingInfo, Reservation, services, service_info, rooms
from django.contrib.auth.models import User
from rest_framework.validators import UniqueValidator
from django.contrib.auth.password_validation import validate_password
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import smart_str, force_str, smart_bytes, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.urls import reverse
from .utils import Util
class SignUpSerializers(serializers.ModelSerializer):
    class Meta:
        model = Signup
        fields = '__all__'



class UserRegisterSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(
        required=True,
        validators=[UniqueValidator(queryset=User.objects.all())]
    )

    password = serializers.CharField(write_only=True, required=True, validators=[validate_password])
    password2 = serializers.CharField(write_only=True, required=True)

    class Meta:
        model = User
        fields = ('username', 'password', 'password2', 'email', 'first_name', 'last_name','is_staff')
        
        extra_kwargs = {
            'first_name': {'required': True},
            'last_name': {'required': True}
        }
       

    def validate(self, attrs):
        if attrs['password'] != attrs['password2']:
            raise serializers.ValidationError({"password": "Password fields didn't match."})

        return attrs

    def create(self, validated_data):
        user = User.objects.create(
            username=validated_data['username'],
            email=validated_data['email'],
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
            is_staff=validated_data['is_staff'],
          
        )

        user.set_password(validated_data['password'])
        user.save()

        return user

class profileSerializer(serializers.ModelSerializer):
    class Meta:
        model=profile
        fields="__all__"


class hotelSerializer(serializers.ModelSerializer):
    class Meta:
        model=Hotels
        fields="__all__"

class roomInfoSerializer(serializers.ModelSerializer):

    class Meta:
        model=Rooms_info
        fields = ('room_number', 'room_type', 'room_price','number_of_beds', 'hotelID', 'roomImage')
        depth = 1

       

class customerDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model=customer_details
        fields="__all__"


class customerInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model=customer_info
        fields="__all__"

class customerSerializer(serializers.ModelSerializer):
    class Meta:
        model=customer
        fields="__all__"


class billingInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model=billingInfo
        fields="__all__"


class reservationSerializer(serializers.ModelSerializer):
    class Meta:
        model=Reservation
        fields="__all__"

class servicesSerializer(serializers.ModelSerializer):
    class Meta:
        model=services
        fields="__all__"


class serviceInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model=service_info
        fields="__all__"


class roomsSerializer(serializers.ModelSerializer):
    class Meta:
        model=rooms
        fields="__all__"


# class ResetPasswordemailRequestSerializer(serializers.Serializer):
#     email =serializers.EmailField(min_length=2)

#     class Meta:
#         field =['email']
    
#     def validate(self, attrs):
    
        
#             email=attrs['data'].get('email', '')
#             if User.objects.filter(email=email).exists():
#                 user=User.objects.filter(email=email)
#                 uidb64=urlsafe_base64_encode(user.id)
#                 token=PasswordResetTokenGenerator().make_token(user)
#                 current_site=get_current_site(request=attrs['data'].get('request')).domain
#                 relativeLink=reverse('Password-reset-confirm', kwargs={'uidb64':uidb64, 'token':token})
#                 absurl='http://'+current_site+relativeLink
#                 email_body="hi"+user.username+'use link belwo to reset your password\n '+absurl
#                 data={'email_body': email_body, 'to_email': user.email, 'email_subject': 'Reset your password'}
#                 Util.send_email(data)
                
#                 return super().validate(attrs)
 
        