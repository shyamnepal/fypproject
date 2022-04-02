from django.shortcuts import render

# Create your views here.
from rest_framework.decorators import api_view,permission_classes
from rest_framework.views import APIView
from .models import  Signup,profile,Hotels,Rooms_info, customer,customer_details, customer_info

from .serializer import SignUpSerializers, UserRegisterSerializer, \
    profileSerializer,hotelSerializer,roomInfoSerializer, User,customerSerializer,customerInfoSerializer, \
        customerDetailsSerializer
from rest_framework.response import Response
from rest_framework import  status
from rest_framework.exceptions import AuthenticationFailed
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.permissions import IsAuthenticated
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from rest_framework.authtoken.models import Token
from rest_framework.parsers import JSONParser
from django.contrib.auth import authenticate
from django.http import  JsonResponse
import jwt, datetime

class LoginView(APIView):
    def post(self, request):
        username = request.data['username']
        password = request.data['password']

        user = User.objects.filter(username=username).first()

        if user is None:
            raise AuthenticationFailed('User not found!')

        if not user.check_password(password):
            raise AuthenticationFailed('Incorrect password!')
        
    

        payload = {
            'id': user.id,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(minutes=60),
            'iat': datetime.datetime.utcnow()
        }

        token = jwt.encode(payload, 'secret', algorithm='HS256')

        response = Response()

        response.set_cookie(key='jwt', value=token, httponly=True)
        response.data = {
            'jwt': token
        }
        return response


@api_view(['GET'])
def showall(request):
    personal_details = Signup.objects.all()
    serializers = SignUpSerializers(personal_details, many=True)
    return Response(serializers.data)




@api_view(['POST'])
def register(request):
    serializers = SignUpSerializers(data=request.data)
    if serializers.is_valid():
        serializers.save()
        return Response(serializers.data, status=status.HTTP_201_CREATED)
    return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['PUT'])
def registerUpdate(request, pk):
    signup=Signup.objects.get(pk=pk)
    serilizers=SignUpSerializers(signup, data=request.data)
    if serilizers.is_valid():
        serilizers.save()
        return Response(serilizers.data)
    return Response(serilizers.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def registerDelete(request,pk):
    signup=Signup.objects.get(pk=pk)
    signup.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)

# @api_view(["GET"])
# def User_logout(request):

#     request.user.auth_token.delete()

#     logout(request)

#     return Response('User Logged out successfully')



@api_view(['PUT'])
def updatehotelInfo(request, pk):
    hotel_details=Hotels.objects.get(pk=pk)
    serilizers=hotelSerializer(hotel_details, data=request.data)
    if serilizers.is_valid():
        serilizers.save()
        return Response(serilizers.data)
    return Response(serilizers.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['PUT'])
def updateroomInfo(request, pk):
    room_details=Rooms_info.objects.get(pk=pk)
    serilizers=roomInfoSerializer(room_details, data=request.data)
    if serilizers.is_valid():
        serilizers.save()
        return Response(serilizers.data)
    return Response(serilizers.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def shwoonedata(request, pk):
    hotel_details=Hotels.objects.get(pk=pk)
    
    serializers = hotelSerializer(hotel_details, many=False)
    return Response(serializers.data)

@api_view(['GET'])
def shwoRoomonedata(request, pk):
    room_details=Rooms_info.objects.get(pk=pk)
    
    serializers = roomInfoSerializer(room_details, many=False)
    return Response(serializers.data)




@api_view(['DELETE'])
def deleateHotelInfo(request,pk):
    hotel_details=Hotels.objects.get(pk=pk)
    hotel_details.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['DELETE'])
def deleateRoomInfo(request,pk):
    room_details=Rooms_info.objects.get(pk=pk)
    room_details.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)

class RegisterAPIView(APIView):
    serializers = UserRegisterSerializer

    def post(self,request):
        serializers = self.serializers(data=request.data)
        if serializers.is_valid():
            user=serializers.save()

            refresh = RefreshToken.for_user(user)

            response_data ={
                'refresh': str(refresh),
                'access': str(refresh.access_token),
            }

            return Response(response_data, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


class LogOutAPIView(APIView):
    def post(self, request, format=None):
        try:
            refresh_token = request.data.get('refresh_token')
            token_obj = RefreshToken(refresh_token)
            token_obj.blacklist()
            return Response(status=status.HTTP_200_OK)
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST)


class profiles(APIView):
    def post(self, request):
        serializer= profileSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'message': 'done'})
        return Response(serializer.errors)

    def get(self, request):
        data=profile.objects.all()
        serializer=profileSerializer(data, many=True)
        return Response(serializer.data)

class HotelsInfo(APIView):
    #permission_classes=[IsAuthenticated]
    def post(self, request):
        serializers = hotelSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)

    def get(self, request):
        hotel_details = Hotels.objects.all()
        serializers = hotelSerializer(hotel_details, many=True)
        return Response(serializers.data)

   

class HotelsRoomInfo(APIView):
    #permission_classes=[IsAuthenticated]
    def post(self, request):
        serializers = roomInfoSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)

    def get(self, request):
        room_details = Rooms_info.objects.all()
        serializers = roomInfoSerializer(room_details, many=True)
        return Response(serializers.data)
 


# class RequestPasswordResetEmail(APIView):
#     serializer_class=ResetPasswordemailRequestSerializer
#     def post(self, request):
#         data={'request':request,'data':request.data}
#         serializer=self.serializer_class(data=data) 
#         serializer.is_valid(raise_exception=True)
#         return Response({'success': 'We have sent you a link to reset your password'},status=status.HTTP_200_OK)

# class PasswordTokenCheckAPI(APIView):
#     def get(self, request, uidb64, token):
#         pass

""" customer Details CRUDE OPERATION """
class CustomerDetails(APIView):
    #permission_classes=[IsAuthenticated]
    def post(self, request):
        serializers = customerDetailsSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)

    def get(self, request):
        customer_detail = customer_details.objects.all()
        serializers = customerDetailsSerializer(customer_detail, many=True)
        return Response(serializers.data)
    

@api_view(['DELETE'])
def customerDelete(request,pk):
    customerDelete=customer_details.objects.get(pk=pk)
    customerDelete.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['PUT'])
def updateCustomerDetails(request, pk):
    customer_detail=customer_details.objects.get(pk=pk)
    serilizers=customerDetailsSerializer(customer_detail, data=request.data)
    if serilizers.is_valid():
        serilizers.save()
        return Response(serilizers.data)
    return Response(serilizers.errors, status=status.HTTP_400_BAD_REQUEST)

def registerUpdate(request, pk):
    signup=Signup.objects.get(pk=pk)
    serilizers=SignUpSerializers(signup, data=request.data)
    if serilizers.is_valid():
        serilizers.save()
        return Response(serilizers.data)
    return Response(serilizers.errors, status=status.HTTP_400_BAD_REQUEST)