from django.shortcuts import render

# Create your views here.
from rest_framework.decorators import api_view,permission_classes
from rest_framework.views import APIView
from .models import Signup,profile,Hotels,Rooms_info

from .serializer import SignUpSerializers, UserRegisterSerializer, \
    profileSerializer,hotelSerializer,roomInfoSerializer
from rest_framework.response import Response
from rest_framework import  status
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.permissions import IsAuthenticated


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

@api_view(["GET"])
def User_logout(request):

    request.user.auth_token.delete()

    logout(request)

    return Response('User Logged out successfully')



@api_view(['PUT'])
def updatehotelInfo(request, pk):
    hotel_details=Hotels.objects.get(pk=pk)
    serilizers=hotelSerializer(hotel_details, data=request.data)
    if serilizers.is_valid():
        serilizers.save()
        return Response(serilizers.data)
    return Response(serilizers.errors, status=status.HTTP_400_BAD_REQUEST)



@api_view(['DELETE'])
def deleateHotelInfo(request,pk):
    hotel_details=Hotels.objects.get(pk=pk)
    hotel_details.delete()
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


# class LogOutAPIView(APIView):
#     def post(self, request, format=None):
#         try:
#             refresh_token = request.data.get('refresh_token')
#             token_obj = RefreshToken(refresh_token)
#             token_obj.blacklist()
#             return Response(status=status.HTTP_200_OK)
#         except Exception as e:
#             return Response(status=status.HTTP_400_BAD_REQUEST)


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
 
    