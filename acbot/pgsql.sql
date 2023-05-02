create table if not exists edge_domains
(
    id           varchar(64) default ''::character varying not null
        constraint domains_pk
            primary key,
    name         varchar(64) default ''::character varying not null,
    is_cloud     boolean     default false                 not null,
    user_id      varchar(64) default '0'::character varying,
    company_id   varchar(64) default '0'::character varying,
    privilege    varchar(64) default '0'::character varying,
    root_node_id varchar(64) default ''::character varying
);

alter table edge_domains
    owner to admin;

create table if not exists compute_nodes
(
    id                  varchar(64) default ''::character varying        not null
        constraint compute_nodes_pk
            primary key,
    name                varchar(32) default '0.0.0.0'::character varying not null,
    slot                integer     default 0                            not null,
    edge_domain_id      varchar(64) default ''::character varying,
    user_id             varchar(64) default '0'::character varying,
    company_id          varchar(64) default '0'::character varying,
    privilege           varchar(64) default '0'::character varying,
    edge_device_info_id varchar(64)
);

alter table compute_nodes
    owner to admin;

create table if not exists compute_node_edges
(
    compute_node_id_1 varchar(64) default ''::character varying not null,
    compute_node_id_2 varchar(64) default ''::character varying not null,
    edge_domain_id    varchar(64) default ''::character varying not null,
    constraint compute_node_edges_pk
        primary key (compute_node_id_1, compute_node_id_2)
);

alter table compute_node_edges
    owner to admin;

create table if not exists company_info
(
    id        varchar(64)  default ''::character varying not null
        constraint idx_16495_primary
            primary key,
    number    varchar(64)  default ' '::character varying,
    full_name varchar(64)  default ''::character varying,
    name      varchar(64)  default ' '::character varying,
    address   varchar(128) default ' '::character varying,
    tel       varchar(32)  default '0'::character varying,
    latitude  varchar(32)  default '0.0000'::character varying,
    longitude varchar(32)  default '0.0000'::character varying,
    user_id   varchar(64)  default '0'::character varying,
    privilege varchar(64)  default '0'::character varying
);

alter table company_info
    owner to admin;

create table if not exists company_purchase_flow
(
    flow_id       varchar(255),
    company_id    varchar(255),
    purchase_time numeric,
    id            serial
        constraint company_purchase_flow_pk
            primary key
);

alter table company_purchase_flow
    owner to admin;

create index if not exists company_purchase_flow_company_id_index
    on company_purchase_flow (company_id);

create index if not exists company_purchase_flow_flow_id_index
    on company_purchase_flow (flow_id);

create table if not exists flow_categories
(
    id   varchar(255) not null
        constraint idx_16553_primary
            primary key,
    name varchar(255)
);

alter table flow_categories
    owner to admin;

create table if not exists flow_instances
(
    id              varchar(255) not null
        constraint idx_16559_primary
            primary key,
    company_id      varchar(255),
    user_id         varchar(255),
    privilege       varchar(255),
    flow_id         varchar(255),
    created_at      numeric,
    name            varchar(255),
    status          varchar(25),
    introduction    text,
    location_id     varchar(255),
    flow_definition text,
    kubernetes      text,
    flow_uuid       varchar(255)
);

alter table flow_instances
    owner to admin;

create table if not exists flows
(
    id                  varchar(255) not null
        constraint idx_16547_primary
            primary key,
    company_id          varchar(255),
    user_id             varchar(255),
    privilege           varchar(255),
    flow_uuid           varchar(255),
    is_public           boolean,
    created_at          numeric,
    category_id         varchar(255),
    name                varchar(255),
    icon                varchar(255),
    version             varchar(255),
    latest              boolean,
    introduction        text,
    markdown            text,
    flow_definition     text,
    kubernetes_template text
);

alter table flows
    owner to admin;

create table if not exists operator_categories
(
    id   varchar(255) not null
        constraint idx_16629_primary
            primary key,
    name varchar(255)
);

alter table operator_categories
    owner to admin;

create table if not exists operator_info
(
    id             varchar(255) not null
        constraint idx_16635_primary
            primary key,
    op_name        varchar(255),
    op_index       bigint,
    image_id       varchar(255),
    replica        bigint,
    location       varchar(255),
    key            varchar(255),
    input          varchar(255),
    output         varchar(255),
    other_info     varchar(255),
    flow_result_id varchar(255)
);

alter table operator_info
    owner to admin;

create index if not exists idx_16635_image
    on operator_info (image_id);

create index if not exists idx_16635_flow_result
    on operator_info (flow_result_id);

create table if not exists operators
(
    id              varchar(255)                                        not null
        constraint idx_16623_primary
            primary key,
    company_id      varchar(255),
    user_id         varchar(255),
    privilege       varchar(255),
    operator_uuid   char(40),
    is_public       boolean,
    created_at      numeric,
    category_id     varchar(255),
    name            varchar(255),
    icon            varchar(255),
    image_uri       varchar(255),
    version         varchar(255),
    latest          boolean,
    introduction    text,
    markdown        text,
    input_count     bigint,
    output_count    bigint,
    input_schema    text,
    output_schema   text,
    flow_params     text,
    instance_params text,
    type            varchar(255) default 'TRANSFORM'::character varying not null,
    input_names     varchar(255),
    output_names    varchar(255)
);

comment on column operators.input_names is '入参的名称';

comment on column operators.output_names is '出参的名称';

alter table operators
    owner to admin;

create table if not exists permission
(
    id          varchar(64) not null
        constraint idx_16641_primary
            primary key,
    url         varchar(255) default ' '::character varying,
    name        varchar(255) default ' '::character varying,
    description varchar(255) default ' '::character varying,
    pid         varchar(255) default ' '::character varying
);

comment on table permission is '权限描述表';

comment on column permission.id is '权限id，采用uuid实现';

comment on column permission.url is '权限对应的url';

comment on column permission.name is '权限对应的名字';

comment on column permission.description is '权限对应的描述';

comment on column permission.pid is '不知道干嘛的，人家加了我也加';

alter table permission
    owner to admin;

create table if not exists edge_device_info
(
    id                    varchar(64),
    secret_key            varchar(64),
    company_id            varchar(64),
    number                varchar(32),
    ip_addr               varchar(32),
    principal             varchar(32),
    province              varchar(32),
    access_time           numeric,
    edge_device_status_id numeric,
    area                  varchar(255),
    user_id               varchar(64),
    privilege             varchar(64),
    edge_type             integer
);

alter table edge_device_info
    owner to admin;

create table if not exists flow_instance_deploys
(
    id              varchar(255) not null,
    operator_id     varchar(255) not null,
    compute_node_id varchar(255),
    operator_index  integer      not null,
    constraint flow_instance_deploys_pk
        primary key (id, operator_index)
);

alter table flow_instance_deploys
    owner to admin;

create or replace view compute_node_edges_detailed
            (compute_node_id_1, compute_node_id_2, compute_node_name_1, compute_node_name_2, edge_domain_id) as
SELECT edges.compute_node_id_1,
       edges.compute_node_id_2,
       nodes1.name AS compute_node_name_1,
       nodes2.name AS compute_node_name_2,
       edges.edge_domain_id
FROM compute_node_edges edges
         JOIN compute_nodes nodes1 ON edges.compute_node_id_1::text = nodes1.id::text
         JOIN compute_nodes nodes2 ON edges.compute_node_id_2::text = nodes2.id::text;

alter table compute_node_edges_detailed
    owner to admin;

create or replace view flow_uuid_instance_count(flow_uuid, count) as
SELECT f.flow_uuid,
       count(fi.id) AS count
FROM flows f
         LEFT JOIN flow_instances fi ON f.id::text = fi.flow_id::text
GROUP BY f.flow_uuid;

alter table flow_uuid_instance_count
    owner to admin;

