from rest_framework.views import APIView
from django.shortcuts import render
from rest_framework.response import Response
from django.contrib.auth.models import User
from rest_framework.decorators import api_view
from api.models import Notes
from api.serializer import NoteSerializer


# Create your views here.
@api_view(['GET'])
def getnote(request):
    notes=Notes.objects.all()
    serializer=NoteSerializer(notes,many=True)
    return Response(serializer.data)

@api_view(['GET'])
def note(request,pk):
    notes=Notes.objects.get(id=pk)
    serializer=NoteSerializer(notes,many=False)
    return Response(serializer.data)

@api_view(['POST'])
def create_note(request):
    data=request.data
    notes=Notes.objects.create(
        body=data['body'],title=data["title"]
    )
    serializer=NoteSerializer(notes,many=False)
    return Response(serializer.data)

@api_view(['PUT'])
def update_note(request,pk):
    data=request.data
    notes=Notes.objects.get(id=pk)
    serializer=NoteSerializer(notes,data=request.POST)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)

@api_view(['DELETE'])
def delete_note(request,pk):
    notes=Notes.objects.get(id=pk)
    notes.delete()
    return Response('Note was deleted')



