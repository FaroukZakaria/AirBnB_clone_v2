#!/usr/bin/python3
""" State Module for HBNB project """
from models.base_model import BaseModel, Base
from models import storage_type
from models.city import City
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship


class State(BaseModel):
    """ State class """
    __tablename__ = 'states'
    if storage_type == 'db':
        name = Column(String(128), nullable=False)
        cities = relationship(
                'City', backref='state',
                cascade='all, delete, delete-orphan'
                )
    else:
        name = ""


        @property
        def cities(self):
            """getter for cities"""
            from models import storage
            cities = []
            for city in cities:
                if city.state_id == self.id:
                    cities.append(city)
            return (cities)
