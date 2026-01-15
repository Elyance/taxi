package com.example.taxi.service;

import com.example.taxi.entity.Client;
import com.example.taxi.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ClientService {

    @Autowired
    private ClientRepository clientRepository;

    public List<Client> getAllClients() {
        return clientRepository.findAll();
    }

    public Client getClientById(Long id) {
        return clientRepository.findById(id).orElse(null);
    }

    public Client createClient(String nom, String telephone) {
        Client client = new Client();
        client.setNom(nom);
        client.setTelephone(telephone);
        return clientRepository.save(client);
    }


    public Client updateClient(Long id, String nom, String telephone) {
        Client client = getClientById(id);
        if (client != null) {
            client.setNom(nom);
            client.setTelephone(telephone);
            return clientRepository.save(client);
        }
        return null;
    }

    public Client updateClient(Client client) {
        return clientRepository.save(client);
    }

    public void deleteClient(Long id) {
        clientRepository.deleteById(id);
    }
}
