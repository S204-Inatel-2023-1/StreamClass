from django.db import models


class FotoGeral(models.Model):
    nome = models.CharField(max_length=100, null=False, blank=False)
    dir = models.CharField(max_length=150, null=False, blank=False)

    def __str__(self):
        return f'FotoGeral [nome={self.nome}]'


class Usuários(models.Model):
    nome = models.CharField(max_length=255, null=False, blank=False)
    email = models.CharField(max_length=255, null=False, blank=False)
    data_nasc = models.DateField(null=False, blank=False)
    data_create = models.DateField(auto_now_add=True)