## Outline:

1. Stakeholders needs: 
    
    [UDG Philosophy](https://www.notion.so/UDG-Philosophy-1fa40ac3a1e880c9b210ea1f411c0b51?pvs=21)
    
    [IEEE UDG Requirements](https://www.notion.so/IEEE-UDG-Requirements-1fa40ac3a1e8802cbca5f503e627a391?pvs=21)
    
    [Spatial Web Design Requirements](https://www.notion.so/Spatial-Web-Design-Requirements-1fc40ac3a1e8809f8cadee9215ff6526?pvs=21)
    
    1. Design principles
    2. Application scenarios and use cases
2. Conceptual design: UDG as a knowledge network supporting cyber physical entities. All things HSML
    
    [Domains, Entities, Places, Agents and Things (The Building Blocks of the UDG)](https://www.notion.so/Domains-Entities-Places-Agents-and-Things-The-Building-Blocks-of-the-UDG-1fa40ac3a1e880e7aceeee94ad149610?pvs=21)
    
    1. Agents, Activities. Roles, and Contracts (The how)
    2. The UDG Taxonomy structure
    3. Events and Hyperspace structures and depictions of transient hyperspace events (the when and where)
    4.  Vector and graph encodings for the generalized UDG.
    5. Group permissions and ACL control for resources within the UDG.
    6. Reporting (The why)
    7. Binding via channels calls within Activities to external services in order to communicate with IoT systems.
    8. Invoking credentials and establishing credential structures.
    9. Stuctures in the UDG. Identification and representation of patterns in the UDG. Some patterns will be created by a single Agent other patterns will emerge from the actions of multiple agents. 
    10. Enable Polycentric Governance
3. Distributed computing: UDG as a set of computing nodes interconnected the the Internet; distributed replication and syncing of content. All things HSTP.
    1. [__Spatial Web Architecture__](spatial-web-architecture.md). Overall architecture of the spatial web node system, which involves both communication across HSTP protocols (query/response) as well as joining nodes together to create ad-hoc super nodes (i.e., spatial web federation).
    2. Structure of the Spatial Web Node, including the primary hstp.d and hsml.d daemons, the domain graph, a credential graph, and a schema graph.
    3. Bridging HSTP and UDG scopes (handled through hstp.d and hsml.d respectively)
    4. Managing internal local hstp.d clocks (repeating internal events) to manage query and updates against live resources.
    5.  Place, Person, Thing and SW Node registry for commonly referenced entities (the Spatial Web registry)
    6. HSQL and HSReporting structures for query/updates and returning response structures.
4. Annex: status of design vs system requirements. Table of P2874 requirements with: met vs not met; relevant design pointers; suggested changes to requirements