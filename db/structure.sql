--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone,
    deleted_at timestamp without time zone
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: spree_addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_addresses (
    id integer NOT NULL,
    firstname character varying,
    lastname character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    zipcode character varying,
    phone character varying,
    state_name character varying,
    alternative_phone character varying,
    company character varying,
    state_id integer,
    country_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_addresses_id_seq OWNED BY spree_addresses.id;


--
-- Name: spree_adjustments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_adjustments (
    id integer NOT NULL,
    source_id integer,
    source_type character varying,
    adjustable_id integer,
    adjustable_type character varying,
    amount numeric(10,2),
    label character varying,
    mandatory boolean,
    eligible boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying,
    order_id integer NOT NULL,
    included boolean DEFAULT false
);


--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_adjustments_id_seq OWNED BY spree_adjustments.id;


--
-- Name: spree_assets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_assets (
    id integer NOT NULL,
    viewable_id integer,
    viewable_type character varying,
    attachment_width integer,
    attachment_height integer,
    attachment_file_size integer,
    "position" integer,
    attachment_content_type character varying,
    attachment_file_name character varying,
    type character varying(75),
    attachment_updated_at timestamp without time zone,
    alt text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: spree_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_assets_id_seq OWNED BY spree_assets.id;


--
-- Name: spree_calculators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_calculators (
    id integer NOT NULL,
    type character varying,
    calculable_id integer,
    calculable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    preferences text,
    deleted_at timestamp without time zone
);


--
-- Name: spree_calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_calculators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_calculators_id_seq OWNED BY spree_calculators.id;


--
-- Name: spree_countries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_countries (
    id integer NOT NULL,
    iso_name character varying,
    iso character varying,
    iso3 character varying,
    name character varying,
    numcode integer,
    states_required boolean DEFAULT false,
    updated_at timestamp without time zone
);


--
-- Name: spree_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_countries_id_seq OWNED BY spree_countries.id;


--
-- Name: spree_credit_cards; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_credit_cards (
    id integer NOT NULL,
    month character varying,
    year character varying,
    cc_type character varying,
    last_digits character varying,
    address_id integer,
    gateway_customer_profile_id character varying,
    gateway_payment_profile_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    user_id integer,
    payment_method_id integer,
    "default" boolean DEFAULT false NOT NULL
);


--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_credit_cards_id_seq OWNED BY spree_credit_cards.id;


--
-- Name: spree_customer_returns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_customer_returns (
    id integer NOT NULL,
    number character varying,
    stock_location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_customer_returns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_customer_returns_id_seq OWNED BY spree_customer_returns.id;


--
-- Name: spree_gateways; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_gateways (
    id integer NOT NULL,
    type character varying,
    name character varying,
    description text,
    active boolean DEFAULT true,
    environment character varying DEFAULT 'development'::character varying,
    server character varying DEFAULT 'test'::character varying,
    test_mode boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    preferences text
);


--
-- Name: spree_gateways_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_gateways_id_seq OWNED BY spree_gateways.id;


--
-- Name: spree_inventory_units; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_inventory_units (
    id integer NOT NULL,
    state character varying,
    variant_id integer,
    order_id integer,
    shipment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pending boolean DEFAULT true,
    line_item_id integer
);


--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_inventory_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_inventory_units_id_seq OWNED BY spree_inventory_units.id;


--
-- Name: spree_line_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_line_items (
    id integer NOT NULL,
    variant_id integer,
    order_id integer,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency character varying,
    cost_price numeric(10,2),
    tax_category_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL
);


--
-- Name: spree_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_line_items_id_seq OWNED BY spree_line_items.id;


--
-- Name: spree_log_entries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_log_entries (
    id integer NOT NULL,
    source_id integer,
    source_type character varying,
    details text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_log_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_log_entries_id_seq OWNED BY spree_log_entries.id;


--
-- Name: spree_option_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_option_types (
    id integer NOT NULL,
    name character varying(100),
    presentation character varying(100),
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_option_types_id_seq OWNED BY spree_option_types.id;


--
-- Name: spree_option_types_prototypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_option_types_prototypes (
    prototype_id integer,
    option_type_id integer
);


--
-- Name: spree_option_values; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_option_values (
    id integer NOT NULL,
    "position" integer,
    name character varying,
    presentation character varying,
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_option_values_id_seq OWNED BY spree_option_values.id;


--
-- Name: spree_option_values_variants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_option_values_variants (
    variant_id integer,
    option_value_id integer
);


--
-- Name: spree_orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_orders (
    id integer NOT NULL,
    number character varying(32),
    item_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    total numeric(10,2) DEFAULT 0.0 NOT NULL,
    state character varying,
    adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    user_id integer,
    completed_at timestamp without time zone,
    bill_address_id integer,
    ship_address_id integer,
    payment_total numeric(10,2) DEFAULT 0.0,
    shipping_method_id integer,
    shipment_state character varying,
    payment_state character varying,
    email character varying,
    special_instructions text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency character varying,
    last_ip_address character varying,
    created_by_id integer,
    shipment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    channel character varying DEFAULT 'spree'::character varying,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    item_count integer DEFAULT 0,
    approver_id integer,
    approved_at timestamp without time zone,
    confirmation_delivered boolean DEFAULT false,
    considered_risky boolean DEFAULT false,
    guest_token character varying,
    canceled_at timestamp without time zone,
    canceler_id integer,
    store_id integer,
    state_lock_version integer DEFAULT 0 NOT NULL
);


--
-- Name: spree_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_orders_id_seq OWNED BY spree_orders.id;


--
-- Name: spree_orders_promotions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_orders_promotions (
    order_id integer,
    promotion_id integer
);


--
-- Name: spree_payment_capture_events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_payment_capture_events (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0,
    payment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_payment_capture_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_payment_capture_events_id_seq OWNED BY spree_payment_capture_events.id;


--
-- Name: spree_payment_methods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_payment_methods (
    id integer NOT NULL,
    type character varying,
    name character varying,
    description text,
    active boolean DEFAULT true,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    display_on character varying,
    auto_capture boolean,
    preferences text
);


--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_payment_methods_id_seq OWNED BY spree_payment_methods.id;


--
-- Name: spree_payments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_payments (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    source_id integer,
    source_type character varying,
    payment_method_id integer,
    state character varying,
    response_code character varying,
    avs_response character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number character varying,
    cvv_response_code character varying,
    cvv_response_message character varying
);


--
-- Name: spree_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_payments_id_seq OWNED BY spree_payments.id;


--
-- Name: spree_preferences; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_preferences (
    id integer NOT NULL,
    value text,
    key character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_preferences_id_seq OWNED BY spree_preferences.id;


--
-- Name: spree_prices; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_prices (
    id integer NOT NULL,
    variant_id integer NOT NULL,
    amount numeric(10,2),
    currency character varying,
    deleted_at timestamp without time zone
);


--
-- Name: spree_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_prices_id_seq OWNED BY spree_prices.id;


--
-- Name: spree_product_option_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_product_option_types (
    id integer NOT NULL,
    "position" integer,
    product_id integer,
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_product_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_product_option_types_id_seq OWNED BY spree_product_option_types.id;


--
-- Name: spree_product_properties; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_product_properties (
    id integer NOT NULL,
    value character varying,
    product_id integer,
    property_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0
);


--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_product_properties_id_seq OWNED BY spree_product_properties.id;


--
-- Name: spree_products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_products (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    available_on timestamp without time zone,
    deleted_at timestamp without time zone,
    slug character varying,
    meta_description text,
    meta_keywords character varying,
    tax_category_id integer,
    shipping_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    promotionable boolean DEFAULT true,
    meta_title character varying
);


--
-- Name: spree_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_products_id_seq OWNED BY spree_products.id;


--
-- Name: spree_products_promotion_rules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_products_promotion_rules (
    product_id integer,
    promotion_rule_id integer
);


--
-- Name: spree_products_taxons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_products_taxons (
    product_id integer,
    taxon_id integer,
    id integer NOT NULL,
    "position" integer
);


--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_products_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_products_taxons_id_seq OWNED BY spree_products_taxons.id;


--
-- Name: spree_promotion_action_line_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_promotion_action_line_items (
    id integer NOT NULL,
    promotion_action_id integer,
    variant_id integer,
    quantity integer DEFAULT 1
);


--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_promotion_action_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_promotion_action_line_items_id_seq OWNED BY spree_promotion_action_line_items.id;


--
-- Name: spree_promotion_actions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_promotion_actions (
    id integer NOT NULL,
    promotion_id integer,
    "position" integer,
    type character varying,
    deleted_at timestamp without time zone
);


--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_promotion_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_promotion_actions_id_seq OWNED BY spree_promotion_actions.id;


--
-- Name: spree_promotion_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_promotion_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying
);


--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_promotion_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_promotion_categories_id_seq OWNED BY spree_promotion_categories.id;


--
-- Name: spree_promotion_rules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_promotion_rules (
    id integer NOT NULL,
    promotion_id integer,
    user_id integer,
    product_group_id integer,
    type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying,
    preferences text
);


--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_promotion_rules_id_seq OWNED BY spree_promotion_rules.id;


--
-- Name: spree_promotion_rules_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_promotion_rules_users (
    user_id integer,
    promotion_rule_id integer
);


--
-- Name: spree_promotions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_promotions (
    id integer NOT NULL,
    description character varying,
    expires_at timestamp without time zone,
    starts_at timestamp without time zone,
    name character varying,
    type character varying,
    usage_limit integer,
    match_policy character varying DEFAULT 'all'::character varying,
    code character varying,
    advertise boolean DEFAULT false,
    path character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    promotion_category_id integer
);


--
-- Name: spree_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_promotions_id_seq OWNED BY spree_promotions.id;


--
-- Name: spree_properties; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_properties (
    id integer NOT NULL,
    name character varying,
    presentation character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_properties_id_seq OWNED BY spree_properties.id;


--
-- Name: spree_properties_prototypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_properties_prototypes (
    prototype_id integer,
    property_id integer
);


--
-- Name: spree_prototypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_prototypes (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_prototypes_id_seq OWNED BY spree_prototypes.id;


--
-- Name: spree_refund_reasons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_refund_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_refund_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_refund_reasons_id_seq OWNED BY spree_refund_reasons.id;


--
-- Name: spree_refunds; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_refunds (
    id integer NOT NULL,
    payment_id integer,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    transaction_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    refund_reason_id integer,
    reimbursement_id integer
);


--
-- Name: spree_refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_refunds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_refunds_id_seq OWNED BY spree_refunds.id;


--
-- Name: spree_reimbursement_credits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_reimbursement_credits (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    reimbursement_id integer,
    creditable_id integer,
    creditable_type character varying
);


--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_reimbursement_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_reimbursement_credits_id_seq OWNED BY spree_reimbursement_credits.id;


--
-- Name: spree_reimbursement_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_reimbursement_types (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying
);


--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_reimbursement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_reimbursement_types_id_seq OWNED BY spree_reimbursement_types.id;


--
-- Name: spree_reimbursements; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_reimbursements (
    id integer NOT NULL,
    number character varying,
    reimbursement_status character varying,
    customer_return_id integer,
    order_id integer,
    total numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_reimbursements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_reimbursements_id_seq OWNED BY spree_reimbursements.id;


--
-- Name: spree_return_authorization_reasons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_return_authorization_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_return_authorization_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_return_authorization_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_return_authorization_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_return_authorization_reasons_id_seq OWNED BY spree_return_authorization_reasons.id;


--
-- Name: spree_return_authorizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_return_authorizations (
    id integer NOT NULL,
    number character varying,
    state character varying,
    order_id integer,
    memo text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    stock_location_id integer,
    return_authorization_reason_id integer
);


--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_return_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_return_authorizations_id_seq OWNED BY spree_return_authorizations.id;


--
-- Name: spree_return_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_return_items (
    id integer NOT NULL,
    return_authorization_id integer,
    inventory_unit_id integer,
    exchange_variant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL,
    included_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    reception_status character varying,
    acceptance_status character varying,
    customer_return_id integer,
    reimbursement_id integer,
    exchange_inventory_unit_id integer,
    acceptance_status_errors text,
    preferred_reimbursement_type_id integer,
    override_reimbursement_type_id integer,
    resellable boolean DEFAULT true NOT NULL
);


--
-- Name: spree_return_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_return_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_return_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_return_items_id_seq OWNED BY spree_return_items.id;


--
-- Name: spree_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_roles (
    id integer NOT NULL,
    name character varying
);


--
-- Name: spree_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_roles_id_seq OWNED BY spree_roles.id;


--
-- Name: spree_roles_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_roles_users (
    role_id integer,
    user_id integer
);


--
-- Name: spree_shipments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_shipments (
    id integer NOT NULL,
    tracking character varying,
    number character varying,
    cost numeric(10,2) DEFAULT 0.0,
    shipped_at timestamp without time zone,
    order_id integer,
    address_id integer,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stock_location_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL
);


--
-- Name: spree_shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_shipments_id_seq OWNED BY spree_shipments.id;


--
-- Name: spree_shipping_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_shipping_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_shipping_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_shipping_categories_id_seq OWNED BY spree_shipping_categories.id;


--
-- Name: spree_shipping_method_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_shipping_method_categories (
    id integer NOT NULL,
    shipping_method_id integer NOT NULL,
    shipping_category_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_shipping_method_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_shipping_method_categories_id_seq OWNED BY spree_shipping_method_categories.id;


--
-- Name: spree_shipping_methods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_shipping_methods (
    id integer NOT NULL,
    name character varying,
    display_on character varying,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tracking_url character varying,
    admin_name character varying,
    tax_category_id integer,
    code character varying
);


--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_shipping_methods_id_seq OWNED BY spree_shipping_methods.id;


--
-- Name: spree_shipping_methods_zones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_shipping_methods_zones (
    shipping_method_id integer,
    zone_id integer
);


--
-- Name: spree_shipping_rates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_shipping_rates (
    id integer NOT NULL,
    shipment_id integer,
    shipping_method_id integer,
    selected boolean DEFAULT false,
    cost numeric(8,2) DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tax_rate_id integer
);


--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_shipping_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_shipping_rates_id_seq OWNED BY spree_shipping_rates.id;


--
-- Name: spree_state_changes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_state_changes (
    id integer NOT NULL,
    name character varying,
    previous_state character varying,
    stateful_id integer,
    user_id integer,
    stateful_type character varying,
    next_state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_state_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_state_changes_id_seq OWNED BY spree_state_changes.id;


--
-- Name: spree_states; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_states (
    id integer NOT NULL,
    name character varying,
    abbr character varying,
    country_id integer,
    updated_at timestamp without time zone
);


--
-- Name: spree_states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_states_id_seq OWNED BY spree_states.id;


--
-- Name: spree_stock_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_stock_items (
    id integer NOT NULL,
    stock_location_id integer,
    variant_id integer,
    count_on_hand integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    backorderable boolean DEFAULT false,
    deleted_at timestamp without time zone
);


--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_stock_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_stock_items_id_seq OWNED BY spree_stock_items.id;


--
-- Name: spree_stock_locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_stock_locations (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    address1 character varying,
    address2 character varying,
    city character varying,
    state_id integer,
    state_name character varying,
    country_id integer,
    zipcode character varying,
    phone character varying,
    active boolean DEFAULT true,
    backorderable_default boolean DEFAULT false,
    propagate_all_variants boolean DEFAULT true,
    admin_name character varying
);


--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_stock_locations_id_seq OWNED BY spree_stock_locations.id;


--
-- Name: spree_stock_movements; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_stock_movements (
    id integer NOT NULL,
    stock_item_id integer,
    quantity integer DEFAULT 0,
    action character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    originator_id integer,
    originator_type character varying
);


--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_stock_movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_stock_movements_id_seq OWNED BY spree_stock_movements.id;


--
-- Name: spree_stock_transfers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_stock_transfers (
    id integer NOT NULL,
    type character varying,
    reference character varying,
    source_location_id integer,
    destination_location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number character varying
);


--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_stock_transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_stock_transfers_id_seq OWNED BY spree_stock_transfers.id;


--
-- Name: spree_stores; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_stores (
    id integer NOT NULL,
    name character varying,
    url character varying,
    meta_description text,
    meta_keywords text,
    seo_title character varying,
    mail_from_address character varying,
    default_currency character varying,
    code character varying,
    "default" boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_stores_id_seq OWNED BY spree_stores.id;


--
-- Name: spree_tax_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_tax_categories (
    id integer NOT NULL,
    name character varying,
    description character varying,
    is_default boolean DEFAULT false,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tax_code character varying
);


--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_tax_categories_id_seq OWNED BY spree_tax_categories.id;


--
-- Name: spree_tax_rates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_tax_rates (
    id integer NOT NULL,
    amount numeric(8,5),
    zone_id integer,
    tax_category_id integer,
    included_in_price boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    show_rate_in_label boolean DEFAULT true,
    deleted_at timestamp without time zone
);


--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_tax_rates_id_seq OWNED BY spree_tax_rates.id;


--
-- Name: spree_taxonomies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_taxonomies (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0
);


--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_taxonomies_id_seq OWNED BY spree_taxonomies.id;


--
-- Name: spree_taxons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_taxons (
    id integer NOT NULL,
    parent_id integer,
    "position" integer DEFAULT 0,
    name character varying NOT NULL,
    permalink character varying,
    taxonomy_id integer,
    lft integer,
    rgt integer,
    icon_file_name character varying,
    icon_content_type character varying,
    icon_file_size integer,
    icon_updated_at timestamp without time zone,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    meta_title character varying,
    meta_description character varying,
    meta_keywords character varying,
    depth integer
);


--
-- Name: spree_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_taxons_id_seq OWNED BY spree_taxons.id;


--
-- Name: spree_taxons_promotion_rules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_taxons_promotion_rules (
    id integer NOT NULL,
    taxon_id integer,
    promotion_rule_id integer
);


--
-- Name: spree_taxons_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_taxons_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_taxons_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_taxons_promotion_rules_id_seq OWNED BY spree_taxons_promotion_rules.id;


--
-- Name: spree_taxons_prototypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_taxons_prototypes (
    id integer NOT NULL,
    taxon_id integer,
    prototype_id integer
);


--
-- Name: spree_taxons_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_taxons_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_taxons_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_taxons_prototypes_id_seq OWNED BY spree_taxons_prototypes.id;


--
-- Name: spree_trackers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_trackers (
    id integer NOT NULL,
    analytics_id character varying,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_trackers_id_seq OWNED BY spree_trackers.id;


--
-- Name: spree_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_users (
    id integer NOT NULL,
    encrypted_password character varying(128),
    password_salt character varying(128),
    email character varying,
    remember_token character varying,
    persistence_token character varying,
    reset_password_token character varying,
    perishable_token character varying,
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    login character varying,
    ship_address_id integer,
    bill_address_id integer,
    authentication_token character varying,
    unlock_token character varying,
    locked_at timestamp without time zone,
    reset_password_sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    spree_api_key character varying(48),
    remember_created_at timestamp without time zone,
    deleted_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone
);


--
-- Name: spree_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_users_id_seq OWNED BY spree_users.id;


--
-- Name: spree_variants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_variants (
    id integer NOT NULL,
    sku character varying DEFAULT ''::character varying NOT NULL,
    weight numeric(8,2) DEFAULT 0.0,
    height numeric(8,2),
    width numeric(8,2),
    depth numeric(8,2),
    deleted_at timestamp without time zone,
    is_master boolean DEFAULT false,
    product_id integer,
    cost_price numeric(10,2),
    "position" integer,
    cost_currency character varying,
    track_inventory boolean DEFAULT true,
    tax_category_id integer,
    updated_at timestamp without time zone,
    stock_items_count integer DEFAULT 0 NOT NULL
);


--
-- Name: spree_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_variants_id_seq OWNED BY spree_variants.id;


--
-- Name: spree_zone_members; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_zone_members (
    id integer NOT NULL,
    zoneable_id integer,
    zoneable_type character varying,
    zone_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_zone_members_id_seq OWNED BY spree_zone_members.id;


--
-- Name: spree_zones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spree_zones (
    id integer NOT NULL,
    name character varying,
    description character varying,
    default_tax boolean DEFAULT false,
    zone_members_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    kind character varying
);


--
-- Name: spree_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spree_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spree_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spree_zones_id_seq OWNED BY spree_zones.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_addresses ALTER COLUMN id SET DEFAULT nextval('spree_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_adjustments ALTER COLUMN id SET DEFAULT nextval('spree_adjustments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_assets ALTER COLUMN id SET DEFAULT nextval('spree_assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_calculators ALTER COLUMN id SET DEFAULT nextval('spree_calculators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_countries ALTER COLUMN id SET DEFAULT nextval('spree_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_credit_cards ALTER COLUMN id SET DEFAULT nextval('spree_credit_cards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_customer_returns ALTER COLUMN id SET DEFAULT nextval('spree_customer_returns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_gateways ALTER COLUMN id SET DEFAULT nextval('spree_gateways_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_inventory_units ALTER COLUMN id SET DEFAULT nextval('spree_inventory_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_line_items ALTER COLUMN id SET DEFAULT nextval('spree_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_log_entries ALTER COLUMN id SET DEFAULT nextval('spree_log_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_option_types ALTER COLUMN id SET DEFAULT nextval('spree_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_option_values ALTER COLUMN id SET DEFAULT nextval('spree_option_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_orders ALTER COLUMN id SET DEFAULT nextval('spree_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_payment_capture_events ALTER COLUMN id SET DEFAULT nextval('spree_payment_capture_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_payment_methods ALTER COLUMN id SET DEFAULT nextval('spree_payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_payments ALTER COLUMN id SET DEFAULT nextval('spree_payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_preferences ALTER COLUMN id SET DEFAULT nextval('spree_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_prices ALTER COLUMN id SET DEFAULT nextval('spree_prices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_product_option_types ALTER COLUMN id SET DEFAULT nextval('spree_product_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_product_properties ALTER COLUMN id SET DEFAULT nextval('spree_product_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_products ALTER COLUMN id SET DEFAULT nextval('spree_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_products_taxons ALTER COLUMN id SET DEFAULT nextval('spree_products_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_promotion_action_line_items ALTER COLUMN id SET DEFAULT nextval('spree_promotion_action_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_promotion_actions ALTER COLUMN id SET DEFAULT nextval('spree_promotion_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_promotion_categories ALTER COLUMN id SET DEFAULT nextval('spree_promotion_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_promotion_rules ALTER COLUMN id SET DEFAULT nextval('spree_promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_promotions ALTER COLUMN id SET DEFAULT nextval('spree_promotions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_properties ALTER COLUMN id SET DEFAULT nextval('spree_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_refund_reasons ALTER COLUMN id SET DEFAULT nextval('spree_refund_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_refunds ALTER COLUMN id SET DEFAULT nextval('spree_refunds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_reimbursement_credits ALTER COLUMN id SET DEFAULT nextval('spree_reimbursement_credits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_reimbursement_types ALTER COLUMN id SET DEFAULT nextval('spree_reimbursement_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_reimbursements ALTER COLUMN id SET DEFAULT nextval('spree_reimbursements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_return_authorization_reasons ALTER COLUMN id SET DEFAULT nextval('spree_return_authorization_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_return_authorizations ALTER COLUMN id SET DEFAULT nextval('spree_return_authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_return_items ALTER COLUMN id SET DEFAULT nextval('spree_return_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_roles ALTER COLUMN id SET DEFAULT nextval('spree_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_shipments ALTER COLUMN id SET DEFAULT nextval('spree_shipments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_shipping_categories ALTER COLUMN id SET DEFAULT nextval('spree_shipping_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_shipping_method_categories ALTER COLUMN id SET DEFAULT nextval('spree_shipping_method_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_shipping_methods ALTER COLUMN id SET DEFAULT nextval('spree_shipping_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_shipping_rates ALTER COLUMN id SET DEFAULT nextval('spree_shipping_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_state_changes ALTER COLUMN id SET DEFAULT nextval('spree_state_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_states ALTER COLUMN id SET DEFAULT nextval('spree_states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_stock_items ALTER COLUMN id SET DEFAULT nextval('spree_stock_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_stock_locations ALTER COLUMN id SET DEFAULT nextval('spree_stock_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_stock_movements ALTER COLUMN id SET DEFAULT nextval('spree_stock_movements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_stock_transfers ALTER COLUMN id SET DEFAULT nextval('spree_stock_transfers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_stores ALTER COLUMN id SET DEFAULT nextval('spree_stores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_tax_categories ALTER COLUMN id SET DEFAULT nextval('spree_tax_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_tax_rates ALTER COLUMN id SET DEFAULT nextval('spree_tax_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_taxonomies ALTER COLUMN id SET DEFAULT nextval('spree_taxonomies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_taxons ALTER COLUMN id SET DEFAULT nextval('spree_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_taxons_promotion_rules ALTER COLUMN id SET DEFAULT nextval('spree_taxons_promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_taxons_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_taxons_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_trackers ALTER COLUMN id SET DEFAULT nextval('spree_trackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_users ALTER COLUMN id SET DEFAULT nextval('spree_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_variants ALTER COLUMN id SET DEFAULT nextval('spree_variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_zone_members ALTER COLUMN id SET DEFAULT nextval('spree_zone_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spree_zones ALTER COLUMN id SET DEFAULT nextval('spree_zones_id_seq'::regclass);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: spree_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_addresses
    ADD CONSTRAINT spree_addresses_pkey PRIMARY KEY (id);


--
-- Name: spree_adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_adjustments
    ADD CONSTRAINT spree_adjustments_pkey PRIMARY KEY (id);


--
-- Name: spree_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_assets
    ADD CONSTRAINT spree_assets_pkey PRIMARY KEY (id);


--
-- Name: spree_calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_calculators
    ADD CONSTRAINT spree_calculators_pkey PRIMARY KEY (id);


--
-- Name: spree_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_countries
    ADD CONSTRAINT spree_countries_pkey PRIMARY KEY (id);


--
-- Name: spree_credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_credit_cards
    ADD CONSTRAINT spree_credit_cards_pkey PRIMARY KEY (id);


--
-- Name: spree_customer_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_customer_returns
    ADD CONSTRAINT spree_customer_returns_pkey PRIMARY KEY (id);


--
-- Name: spree_gateways_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_gateways
    ADD CONSTRAINT spree_gateways_pkey PRIMARY KEY (id);


--
-- Name: spree_inventory_units_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_inventory_units
    ADD CONSTRAINT spree_inventory_units_pkey PRIMARY KEY (id);


--
-- Name: spree_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_line_items
    ADD CONSTRAINT spree_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_log_entries
    ADD CONSTRAINT spree_log_entries_pkey PRIMARY KEY (id);


--
-- Name: spree_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_option_types
    ADD CONSTRAINT spree_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_option_values
    ADD CONSTRAINT spree_option_values_pkey PRIMARY KEY (id);


--
-- Name: spree_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_orders
    ADD CONSTRAINT spree_orders_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_capture_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_payment_capture_events
    ADD CONSTRAINT spree_payment_capture_events_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_payment_methods
    ADD CONSTRAINT spree_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_payments
    ADD CONSTRAINT spree_payments_pkey PRIMARY KEY (id);


--
-- Name: spree_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_preferences
    ADD CONSTRAINT spree_preferences_pkey PRIMARY KEY (id);


--
-- Name: spree_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_prices
    ADD CONSTRAINT spree_prices_pkey PRIMARY KEY (id);


--
-- Name: spree_product_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_product_option_types
    ADD CONSTRAINT spree_product_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_product_properties
    ADD CONSTRAINT spree_product_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_products
    ADD CONSTRAINT spree_products_pkey PRIMARY KEY (id);


--
-- Name: spree_products_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_products_taxons
    ADD CONSTRAINT spree_products_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_action_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_action_line_items
    ADD CONSTRAINT spree_promotion_action_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_actions
    ADD CONSTRAINT spree_promotion_actions_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_categories
    ADD CONSTRAINT spree_promotion_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_rules
    ADD CONSTRAINT spree_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_promotions
    ADD CONSTRAINT spree_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_properties
    ADD CONSTRAINT spree_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_prototypes
    ADD CONSTRAINT spree_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_refund_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_refund_reasons
    ADD CONSTRAINT spree_refund_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_refunds
    ADD CONSTRAINT spree_refunds_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_reimbursement_credits
    ADD CONSTRAINT spree_reimbursement_credits_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_reimbursement_types
    ADD CONSTRAINT spree_reimbursement_types_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursements_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_reimbursements
    ADD CONSTRAINT spree_reimbursements_pkey PRIMARY KEY (id);


--
-- Name: spree_return_authorization_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_return_authorization_reasons
    ADD CONSTRAINT spree_return_authorization_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_return_authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_return_authorizations
    ADD CONSTRAINT spree_return_authorizations_pkey PRIMARY KEY (id);


--
-- Name: spree_return_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_return_items
    ADD CONSTRAINT spree_return_items_pkey PRIMARY KEY (id);


--
-- Name: spree_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_roles
    ADD CONSTRAINT spree_roles_pkey PRIMARY KEY (id);


--
-- Name: spree_shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_shipments
    ADD CONSTRAINT spree_shipments_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_categories
    ADD CONSTRAINT spree_shipping_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_method_categories
    ADD CONSTRAINT spree_shipping_method_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_methods
    ADD CONSTRAINT spree_shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_rates
    ADD CONSTRAINT spree_shipping_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_state_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_state_changes
    ADD CONSTRAINT spree_state_changes_pkey PRIMARY KEY (id);


--
-- Name: spree_states_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_states
    ADD CONSTRAINT spree_states_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_stock_items
    ADD CONSTRAINT spree_stock_items_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_stock_locations
    ADD CONSTRAINT spree_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_stock_movements
    ADD CONSTRAINT spree_stock_movements_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_stock_transfers
    ADD CONSTRAINT spree_stock_transfers_pkey PRIMARY KEY (id);


--
-- Name: spree_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_stores
    ADD CONSTRAINT spree_stores_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_tax_categories
    ADD CONSTRAINT spree_tax_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_tax_rates
    ADD CONSTRAINT spree_tax_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_taxonomies
    ADD CONSTRAINT spree_taxonomies_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_taxons
    ADD CONSTRAINT spree_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_taxons_promotion_rules
    ADD CONSTRAINT spree_taxons_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_taxons_prototypes
    ADD CONSTRAINT spree_taxons_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_trackers
    ADD CONSTRAINT spree_trackers_pkey PRIMARY KEY (id);


--
-- Name: spree_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_users
    ADD CONSTRAINT spree_users_pkey PRIMARY KEY (id);


--
-- Name: spree_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_variants
    ADD CONSTRAINT spree_variants_pkey PRIMARY KEY (id);


--
-- Name: spree_zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_zone_members
    ADD CONSTRAINT spree_zone_members_pkey PRIMARY KEY (id);


--
-- Name: spree_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spree_zones
    ADD CONSTRAINT spree_zones_pkey PRIMARY KEY (id);


--
-- Name: email_idx_unique; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX email_idx_unique ON spree_users USING btree (email);


--
-- Name: index_addresses_on_firstname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_addresses_on_firstname ON spree_addresses USING btree (firstname);


--
-- Name: index_addresses_on_lastname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_addresses_on_lastname ON spree_addresses USING btree (lastname);


--
-- Name: index_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_adjustments_on_order_id ON spree_adjustments USING btree (adjustable_id);


--
-- Name: index_assets_on_viewable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_id ON spree_assets USING btree (viewable_id);


--
-- Name: index_assets_on_viewable_type_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_type_and_type ON spree_assets USING btree (viewable_type, type);


--
-- Name: index_friendly_id_slugs_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_deleted_at ON friendly_id_slugs USING btree (deleted_at);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_inventory_units_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_inventory_units_on_order_id ON spree_inventory_units USING btree (order_id);


--
-- Name: index_inventory_units_on_shipment_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_inventory_units_on_shipment_id ON spree_inventory_units USING btree (shipment_id);


--
-- Name: index_inventory_units_on_variant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_inventory_units_on_variant_id ON spree_inventory_units USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_option_values_variants_on_variant_id_and_option_value_id ON spree_option_values_variants USING btree (variant_id, option_value_id);


--
-- Name: index_product_properties_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_properties_on_product_id ON spree_product_properties USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_product_id ON spree_products_promotion_rules USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_promotion_rule_id ON spree_products_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_on_product_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_product_group_id ON spree_promotion_rules USING btree (product_group_id);


--
-- Name: index_promotion_rules_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_user_id ON spree_promotion_rules USING btree (user_id);


--
-- Name: index_promotion_rules_users_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_promotion_rule_id ON spree_promotion_rules_users USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_user_id ON spree_promotion_rules_users USING btree (user_id);


--
-- Name: index_refunds_on_refund_reason_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refunds_on_refund_reason_id ON spree_refunds USING btree (refund_reason_id);


--
-- Name: index_return_authorizations_on_return_authorization_reason_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_return_authorizations_on_return_authorization_reason_id ON spree_return_authorizations USING btree (return_authorization_reason_id);


--
-- Name: index_return_items_on_customer_return_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_return_items_on_customer_return_id ON spree_return_items USING btree (customer_return_id);


--
-- Name: index_shipments_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shipments_on_number ON spree_shipments USING btree (number);


--
-- Name: index_spree_addresses_on_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_addresses_on_country_id ON spree_addresses USING btree (country_id);


--
-- Name: index_spree_addresses_on_state_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_addresses_on_state_id ON spree_addresses USING btree (state_id);


--
-- Name: index_spree_adjustments_on_adjustable_id_and_adjustable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_adjustable_id_and_adjustable_type ON spree_adjustments USING btree (adjustable_id, adjustable_type);


--
-- Name: index_spree_adjustments_on_eligible; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_eligible ON spree_adjustments USING btree (eligible);


--
-- Name: index_spree_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_order_id ON spree_adjustments USING btree (order_id);


--
-- Name: index_spree_adjustments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_source_id_and_source_type ON spree_adjustments USING btree (source_id, source_type);


--
-- Name: index_spree_calculators_on_calculable_id_and_calculable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_calculators_on_calculable_id_and_calculable_type ON spree_calculators USING btree (calculable_id, calculable_type);


--
-- Name: index_spree_calculators_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_calculators_on_deleted_at ON spree_calculators USING btree (deleted_at);


--
-- Name: index_spree_calculators_on_id_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_calculators_on_id_and_type ON spree_calculators USING btree (id, type);


--
-- Name: index_spree_credit_cards_on_address_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_credit_cards_on_address_id ON spree_credit_cards USING btree (address_id);


--
-- Name: index_spree_credit_cards_on_payment_method_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_credit_cards_on_payment_method_id ON spree_credit_cards USING btree (payment_method_id);


--
-- Name: index_spree_credit_cards_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_credit_cards_on_user_id ON spree_credit_cards USING btree (user_id);


--
-- Name: index_spree_gateways_on_active; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_gateways_on_active ON spree_gateways USING btree (active);


--
-- Name: index_spree_gateways_on_test_mode; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_gateways_on_test_mode ON spree_gateways USING btree (test_mode);


--
-- Name: index_spree_inventory_units_on_line_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_inventory_units_on_line_item_id ON spree_inventory_units USING btree (line_item_id);


--
-- Name: index_spree_line_items_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_line_items_on_order_id ON spree_line_items USING btree (order_id);


--
-- Name: index_spree_line_items_on_tax_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_line_items_on_tax_category_id ON spree_line_items USING btree (tax_category_id);


--
-- Name: index_spree_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_line_items_on_variant_id ON spree_line_items USING btree (variant_id);


--
-- Name: index_spree_log_entries_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_log_entries_on_source_id_and_source_type ON spree_log_entries USING btree (source_id, source_type);


--
-- Name: index_spree_option_types_on_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_option_types_on_position ON spree_option_types USING btree ("position");


--
-- Name: index_spree_option_values_on_option_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_option_values_on_option_type_id ON spree_option_values USING btree (option_type_id);


--
-- Name: index_spree_option_values_on_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_option_values_on_position ON spree_option_values USING btree ("position");


--
-- Name: index_spree_option_values_variants_on_variant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_option_values_variants_on_variant_id ON spree_option_values_variants USING btree (variant_id);


--
-- Name: index_spree_orders_on_approver_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_approver_id ON spree_orders USING btree (approver_id);


--
-- Name: index_spree_orders_on_bill_address_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_bill_address_id ON spree_orders USING btree (bill_address_id);


--
-- Name: index_spree_orders_on_completed_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_completed_at ON spree_orders USING btree (completed_at);


--
-- Name: index_spree_orders_on_confirmation_delivered; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_confirmation_delivered ON spree_orders USING btree (confirmation_delivered);


--
-- Name: index_spree_orders_on_considered_risky; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_considered_risky ON spree_orders USING btree (considered_risky);


--
-- Name: index_spree_orders_on_created_by_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_created_by_id ON spree_orders USING btree (created_by_id);


--
-- Name: index_spree_orders_on_guest_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_guest_token ON spree_orders USING btree (guest_token);


--
-- Name: index_spree_orders_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_number ON spree_orders USING btree (number);


--
-- Name: index_spree_orders_on_ship_address_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_ship_address_id ON spree_orders USING btree (ship_address_id);


--
-- Name: index_spree_orders_on_shipping_method_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_shipping_method_id ON spree_orders USING btree (shipping_method_id);


--
-- Name: index_spree_orders_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_user_id ON spree_orders USING btree (user_id);


--
-- Name: index_spree_orders_on_user_id_and_created_by_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_on_user_id_and_created_by_id ON spree_orders USING btree (user_id, created_by_id);


--
-- Name: index_spree_orders_promotions_on_order_id_and_promotion_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_orders_promotions_on_order_id_and_promotion_id ON spree_orders_promotions USING btree (order_id, promotion_id);


--
-- Name: index_spree_payment_capture_events_on_payment_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_payment_capture_events_on_payment_id ON spree_payment_capture_events USING btree (payment_id);


--
-- Name: index_spree_payment_methods_on_id_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_payment_methods_on_id_and_type ON spree_payment_methods USING btree (id, type);


--
-- Name: index_spree_payments_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_payments_on_number ON spree_payments USING btree (number);


--
-- Name: index_spree_payments_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_payments_on_order_id ON spree_payments USING btree (order_id);


--
-- Name: index_spree_payments_on_payment_method_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_payments_on_payment_method_id ON spree_payments USING btree (payment_method_id);


--
-- Name: index_spree_payments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_payments_on_source_id_and_source_type ON spree_payments USING btree (source_id, source_type);


--
-- Name: index_spree_preferences_on_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_preferences_on_key ON spree_preferences USING btree (key);


--
-- Name: index_spree_prices_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_prices_on_deleted_at ON spree_prices USING btree (deleted_at);


--
-- Name: index_spree_prices_on_variant_id_and_currency; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_prices_on_variant_id_and_currency ON spree_prices USING btree (variant_id, currency);


--
-- Name: index_spree_product_option_types_on_option_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_product_option_types_on_option_type_id ON spree_product_option_types USING btree (option_type_id);


--
-- Name: index_spree_product_option_types_on_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_product_option_types_on_position ON spree_product_option_types USING btree ("position");


--
-- Name: index_spree_product_option_types_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_product_option_types_on_product_id ON spree_product_option_types USING btree (product_id);


--
-- Name: index_spree_product_properties_on_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_product_properties_on_position ON spree_product_properties USING btree ("position");


--
-- Name: index_spree_product_properties_on_property_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_product_properties_on_property_id ON spree_product_properties USING btree (property_id);


--
-- Name: index_spree_products_on_available_on; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_products_on_available_on ON spree_products USING btree (available_on);


--
-- Name: index_spree_products_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_products_on_deleted_at ON spree_products USING btree (deleted_at);


--
-- Name: index_spree_products_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_products_on_name ON spree_products USING btree (name);


--
-- Name: index_spree_products_on_shipping_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_products_on_shipping_category_id ON spree_products USING btree (shipping_category_id);


--
-- Name: index_spree_products_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_products_on_slug ON spree_products USING btree (slug);


--
-- Name: index_spree_products_on_tax_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_products_on_tax_category_id ON spree_products USING btree (tax_category_id);


--
-- Name: index_spree_products_taxons_on_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_products_taxons_on_position ON spree_products_taxons USING btree ("position");


--
-- Name: index_spree_products_taxons_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_products_taxons_on_product_id ON spree_products_taxons USING btree (product_id);


--
-- Name: index_spree_products_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_products_taxons_on_taxon_id ON spree_products_taxons USING btree (taxon_id);


--
-- Name: index_spree_promotion_action_line_items_on_promotion_action_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotion_action_line_items_on_promotion_action_id ON spree_promotion_action_line_items USING btree (promotion_action_id);


--
-- Name: index_spree_promotion_action_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotion_action_line_items_on_variant_id ON spree_promotion_action_line_items USING btree (variant_id);


--
-- Name: index_spree_promotion_actions_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotion_actions_on_deleted_at ON spree_promotion_actions USING btree (deleted_at);


--
-- Name: index_spree_promotion_actions_on_id_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotion_actions_on_id_and_type ON spree_promotion_actions USING btree (id, type);


--
-- Name: index_spree_promotion_actions_on_promotion_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotion_actions_on_promotion_id ON spree_promotion_actions USING btree (promotion_id);


--
-- Name: index_spree_promotion_rules_on_promotion_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotion_rules_on_promotion_id ON spree_promotion_rules USING btree (promotion_id);


--
-- Name: index_spree_promotions_on_advertise; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_advertise ON spree_promotions USING btree (advertise);


--
-- Name: index_spree_promotions_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_code ON spree_promotions USING btree (code);


--
-- Name: index_spree_promotions_on_expires_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_expires_at ON spree_promotions USING btree (expires_at);


--
-- Name: index_spree_promotions_on_id_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_id_and_type ON spree_promotions USING btree (id, type);


--
-- Name: index_spree_promotions_on_promotion_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_promotion_category_id ON spree_promotions USING btree (promotion_category_id);


--
-- Name: index_spree_promotions_on_starts_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_starts_at ON spree_promotions USING btree (starts_at);


--
-- Name: index_spree_reimbursement_types_on_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_reimbursement_types_on_type ON spree_reimbursement_types USING btree (type);


--
-- Name: index_spree_reimbursements_on_customer_return_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_reimbursements_on_customer_return_id ON spree_reimbursements USING btree (customer_return_id);


--
-- Name: index_spree_reimbursements_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_reimbursements_on_order_id ON spree_reimbursements USING btree (order_id);


--
-- Name: index_spree_return_items_on_exchange_inventory_unit_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_return_items_on_exchange_inventory_unit_id ON spree_return_items USING btree (exchange_inventory_unit_id);


--
-- Name: index_spree_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_roles_users_on_role_id ON spree_roles_users USING btree (role_id);


--
-- Name: index_spree_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_roles_users_on_user_id ON spree_roles_users USING btree (user_id);


--
-- Name: index_spree_shipments_on_address_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_shipments_on_address_id ON spree_shipments USING btree (address_id);


--
-- Name: index_spree_shipments_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_shipments_on_order_id ON spree_shipments USING btree (order_id);


--
-- Name: index_spree_shipments_on_stock_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_shipments_on_stock_location_id ON spree_shipments USING btree (stock_location_id);


--
-- Name: index_spree_shipping_method_categories_on_shipping_method_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_shipping_method_categories_on_shipping_method_id ON spree_shipping_method_categories USING btree (shipping_method_id);


--
-- Name: index_spree_shipping_methods_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_shipping_methods_on_deleted_at ON spree_shipping_methods USING btree (deleted_at);


--
-- Name: index_spree_shipping_methods_on_tax_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_shipping_methods_on_tax_category_id ON spree_shipping_methods USING btree (tax_category_id);


--
-- Name: index_spree_shipping_rates_on_selected; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_shipping_rates_on_selected ON spree_shipping_rates USING btree (selected);


--
-- Name: index_spree_shipping_rates_on_tax_rate_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_shipping_rates_on_tax_rate_id ON spree_shipping_rates USING btree (tax_rate_id);


--
-- Name: index_spree_state_changes_on_stateful_id_and_stateful_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_state_changes_on_stateful_id_and_stateful_type ON spree_state_changes USING btree (stateful_id, stateful_type);


--
-- Name: index_spree_state_changes_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_state_changes_on_user_id ON spree_state_changes USING btree (user_id);


--
-- Name: index_spree_states_on_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_states_on_country_id ON spree_states USING btree (country_id);


--
-- Name: index_spree_stock_items_on_backorderable; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_items_on_backorderable ON spree_stock_items USING btree (backorderable);


--
-- Name: index_spree_stock_items_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_items_on_deleted_at ON spree_stock_items USING btree (deleted_at);


--
-- Name: index_spree_stock_items_on_stock_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_items_on_stock_location_id ON spree_stock_items USING btree (stock_location_id);


--
-- Name: index_spree_stock_items_on_variant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_items_on_variant_id ON spree_stock_items USING btree (variant_id);


--
-- Name: index_spree_stock_locations_on_active; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_active ON spree_stock_locations USING btree (active);


--
-- Name: index_spree_stock_locations_on_backorderable_default; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_backorderable_default ON spree_stock_locations USING btree (backorderable_default);


--
-- Name: index_spree_stock_locations_on_country_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_country_id ON spree_stock_locations USING btree (country_id);


--
-- Name: index_spree_stock_locations_on_propagate_all_variants; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_propagate_all_variants ON spree_stock_locations USING btree (propagate_all_variants);


--
-- Name: index_spree_stock_locations_on_state_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_state_id ON spree_stock_locations USING btree (state_id);


--
-- Name: index_spree_stock_movements_on_stock_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_movements_on_stock_item_id ON spree_stock_movements USING btree (stock_item_id);


--
-- Name: index_spree_stock_transfers_on_destination_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_destination_location_id ON spree_stock_transfers USING btree (destination_location_id);


--
-- Name: index_spree_stock_transfers_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_number ON spree_stock_transfers USING btree (number);


--
-- Name: index_spree_stock_transfers_on_source_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_source_location_id ON spree_stock_transfers USING btree (source_location_id);


--
-- Name: index_spree_stores_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stores_on_code ON spree_stores USING btree (code);


--
-- Name: index_spree_stores_on_default; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stores_on_default ON spree_stores USING btree ("default");


--
-- Name: index_spree_stores_on_url; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_stores_on_url ON spree_stores USING btree (url);


--
-- Name: index_spree_tax_categories_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_tax_categories_on_deleted_at ON spree_tax_categories USING btree (deleted_at);


--
-- Name: index_spree_tax_categories_on_is_default; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_tax_categories_on_is_default ON spree_tax_categories USING btree (is_default);


--
-- Name: index_spree_tax_rates_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_deleted_at ON spree_tax_rates USING btree (deleted_at);


--
-- Name: index_spree_tax_rates_on_included_in_price; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_included_in_price ON spree_tax_rates USING btree (included_in_price);


--
-- Name: index_spree_tax_rates_on_show_rate_in_label; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_show_rate_in_label ON spree_tax_rates USING btree (show_rate_in_label);


--
-- Name: index_spree_tax_rates_on_tax_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_tax_category_id ON spree_tax_rates USING btree (tax_category_id);


--
-- Name: index_spree_tax_rates_on_zone_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_zone_id ON spree_tax_rates USING btree (zone_id);


--
-- Name: index_spree_taxonomies_on_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_taxonomies_on_position ON spree_taxonomies USING btree ("position");


--
-- Name: index_spree_taxons_on_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_taxons_on_position ON spree_taxons USING btree ("position");


--
-- Name: index_spree_taxons_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_taxons_promotion_rules_on_promotion_rule_id ON spree_taxons_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_spree_taxons_promotion_rules_on_taxon_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_taxons_promotion_rules_on_taxon_id ON spree_taxons_promotion_rules USING btree (taxon_id);


--
-- Name: index_spree_taxons_prototypes_on_prototype_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_taxons_prototypes_on_prototype_id ON spree_taxons_prototypes USING btree (prototype_id);


--
-- Name: index_spree_taxons_prototypes_on_taxon_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_taxons_prototypes_on_taxon_id ON spree_taxons_prototypes USING btree (taxon_id);


--
-- Name: index_spree_trackers_on_active; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_trackers_on_active ON spree_trackers USING btree (active);


--
-- Name: index_spree_users_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_users_on_deleted_at ON spree_users USING btree (deleted_at);


--
-- Name: index_spree_users_on_spree_api_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_users_on_spree_api_key ON spree_users USING btree (spree_api_key);


--
-- Name: index_spree_variants_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_variants_on_deleted_at ON spree_variants USING btree (deleted_at);


--
-- Name: index_spree_variants_on_is_master; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_variants_on_is_master ON spree_variants USING btree (is_master);


--
-- Name: index_spree_variants_on_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_variants_on_position ON spree_variants USING btree ("position");


--
-- Name: index_spree_variants_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_variants_on_product_id ON spree_variants USING btree (product_id);


--
-- Name: index_spree_variants_on_sku; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_variants_on_sku ON spree_variants USING btree (sku);


--
-- Name: index_spree_variants_on_tax_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_variants_on_tax_category_id ON spree_variants USING btree (tax_category_id);


--
-- Name: index_spree_variants_on_track_inventory; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_variants_on_track_inventory ON spree_variants USING btree (track_inventory);


--
-- Name: index_spree_zone_members_on_zone_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_zone_members_on_zone_id ON spree_zone_members USING btree (zone_id);


--
-- Name: index_spree_zone_members_on_zoneable_id_and_zoneable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_zone_members_on_zoneable_id_and_zoneable_type ON spree_zone_members USING btree (zoneable_id, zoneable_type);


--
-- Name: index_spree_zones_on_default_tax; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_zones_on_default_tax ON spree_zones USING btree (default_tax);


--
-- Name: index_spree_zones_on_kind; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spree_zones_on_kind ON spree_zones USING btree (kind);


--
-- Name: index_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taxons_on_parent_id ON spree_taxons USING btree (parent_id);


--
-- Name: index_taxons_on_permalink; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taxons_on_permalink ON spree_taxons USING btree (permalink);


--
-- Name: index_taxons_on_taxonomy_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taxons_on_taxonomy_id ON spree_taxons USING btree (taxonomy_id);


--
-- Name: spree_shipping_rates_join_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX spree_shipping_rates_join_index ON spree_shipping_rates USING btree (shipment_id, shipping_method_id);


--
-- Name: stock_item_by_loc_and_var_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX stock_item_by_loc_and_var_id ON spree_stock_items USING btree (stock_location_id, variant_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: unique_spree_shipping_method_categories; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_spree_shipping_method_categories ON spree_shipping_method_categories USING btree (shipping_category_id, shipping_method_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20160628183513');

INSERT INTO schema_migrations (version) VALUES ('20160628183514');

INSERT INTO schema_migrations (version) VALUES ('20160628183515');

INSERT INTO schema_migrations (version) VALUES ('20160628183516');

INSERT INTO schema_migrations (version) VALUES ('20160628183517');

INSERT INTO schema_migrations (version) VALUES ('20160628183518');

INSERT INTO schema_migrations (version) VALUES ('20160628183519');

INSERT INTO schema_migrations (version) VALUES ('20160628183520');

INSERT INTO schema_migrations (version) VALUES ('20160628183521');

INSERT INTO schema_migrations (version) VALUES ('20160628183522');

INSERT INTO schema_migrations (version) VALUES ('20160628183523');

INSERT INTO schema_migrations (version) VALUES ('20160628183524');

INSERT INTO schema_migrations (version) VALUES ('20160628183525');

INSERT INTO schema_migrations (version) VALUES ('20160628183526');

INSERT INTO schema_migrations (version) VALUES ('20160628183527');

INSERT INTO schema_migrations (version) VALUES ('20160628183528');

INSERT INTO schema_migrations (version) VALUES ('20160628183529');

INSERT INTO schema_migrations (version) VALUES ('20160628183530');

INSERT INTO schema_migrations (version) VALUES ('20160628183531');

INSERT INTO schema_migrations (version) VALUES ('20160628183532');

INSERT INTO schema_migrations (version) VALUES ('20160628183533');

INSERT INTO schema_migrations (version) VALUES ('20160628183534');

INSERT INTO schema_migrations (version) VALUES ('20160628183535');

INSERT INTO schema_migrations (version) VALUES ('20160628183536');

INSERT INTO schema_migrations (version) VALUES ('20160628183537');

INSERT INTO schema_migrations (version) VALUES ('20160628183538');

INSERT INTO schema_migrations (version) VALUES ('20160628183539');

INSERT INTO schema_migrations (version) VALUES ('20160628183540');

INSERT INTO schema_migrations (version) VALUES ('20160628183541');

INSERT INTO schema_migrations (version) VALUES ('20160628183542');

INSERT INTO schema_migrations (version) VALUES ('20160628183543');

INSERT INTO schema_migrations (version) VALUES ('20160628183544');

INSERT INTO schema_migrations (version) VALUES ('20160628183545');

INSERT INTO schema_migrations (version) VALUES ('20160628183546');

INSERT INTO schema_migrations (version) VALUES ('20160628183547');

INSERT INTO schema_migrations (version) VALUES ('20160628183548');

INSERT INTO schema_migrations (version) VALUES ('20160628183549');

INSERT INTO schema_migrations (version) VALUES ('20160628183550');

INSERT INTO schema_migrations (version) VALUES ('20160628183551');

INSERT INTO schema_migrations (version) VALUES ('20160628183552');

INSERT INTO schema_migrations (version) VALUES ('20160628183553');

INSERT INTO schema_migrations (version) VALUES ('20160628183554');

INSERT INTO schema_migrations (version) VALUES ('20160628183555');

INSERT INTO schema_migrations (version) VALUES ('20160628183556');

INSERT INTO schema_migrations (version) VALUES ('20160628183557');

INSERT INTO schema_migrations (version) VALUES ('20160628183558');

INSERT INTO schema_migrations (version) VALUES ('20160628183559');

INSERT INTO schema_migrations (version) VALUES ('20160628183560');

INSERT INTO schema_migrations (version) VALUES ('20160628183561');

INSERT INTO schema_migrations (version) VALUES ('20160628183562');

INSERT INTO schema_migrations (version) VALUES ('20160628183563');

INSERT INTO schema_migrations (version) VALUES ('20160628183564');

INSERT INTO schema_migrations (version) VALUES ('20160628183565');

INSERT INTO schema_migrations (version) VALUES ('20160628183566');

INSERT INTO schema_migrations (version) VALUES ('20160628183567');

INSERT INTO schema_migrations (version) VALUES ('20160628183568');

INSERT INTO schema_migrations (version) VALUES ('20160628183569');

INSERT INTO schema_migrations (version) VALUES ('20160628183570');

INSERT INTO schema_migrations (version) VALUES ('20160628183571');

INSERT INTO schema_migrations (version) VALUES ('20160628183572');

INSERT INTO schema_migrations (version) VALUES ('20160628183573');

INSERT INTO schema_migrations (version) VALUES ('20160628183574');

INSERT INTO schema_migrations (version) VALUES ('20160628183575');

INSERT INTO schema_migrations (version) VALUES ('20160628183576');

INSERT INTO schema_migrations (version) VALUES ('20160628183577');

INSERT INTO schema_migrations (version) VALUES ('20160628183578');

INSERT INTO schema_migrations (version) VALUES ('20160628183579');

INSERT INTO schema_migrations (version) VALUES ('20160628183580');

INSERT INTO schema_migrations (version) VALUES ('20160628183581');

INSERT INTO schema_migrations (version) VALUES ('20160628183582');

INSERT INTO schema_migrations (version) VALUES ('20160628183583');

INSERT INTO schema_migrations (version) VALUES ('20160628183584');

INSERT INTO schema_migrations (version) VALUES ('20160628183585');

INSERT INTO schema_migrations (version) VALUES ('20160628183586');

INSERT INTO schema_migrations (version) VALUES ('20160628183587');

INSERT INTO schema_migrations (version) VALUES ('20160628183588');

INSERT INTO schema_migrations (version) VALUES ('20160628183589');

INSERT INTO schema_migrations (version) VALUES ('20160628183590');

INSERT INTO schema_migrations (version) VALUES ('20160628183591');

INSERT INTO schema_migrations (version) VALUES ('20160628183592');

INSERT INTO schema_migrations (version) VALUES ('20160628183593');

INSERT INTO schema_migrations (version) VALUES ('20160628183594');

INSERT INTO schema_migrations (version) VALUES ('20160628183595');

INSERT INTO schema_migrations (version) VALUES ('20160628183596');

INSERT INTO schema_migrations (version) VALUES ('20160628183597');

INSERT INTO schema_migrations (version) VALUES ('20160628183598');

INSERT INTO schema_migrations (version) VALUES ('20160628183599');

INSERT INTO schema_migrations (version) VALUES ('20160628183600');

INSERT INTO schema_migrations (version) VALUES ('20160628183601');

INSERT INTO schema_migrations (version) VALUES ('20160628183602');

INSERT INTO schema_migrations (version) VALUES ('20160628183603');

INSERT INTO schema_migrations (version) VALUES ('20160628183604');

INSERT INTO schema_migrations (version) VALUES ('20160628183605');

INSERT INTO schema_migrations (version) VALUES ('20160628183606');

INSERT INTO schema_migrations (version) VALUES ('20160628183607');

INSERT INTO schema_migrations (version) VALUES ('20160628183608');

INSERT INTO schema_migrations (version) VALUES ('20160628183609');

INSERT INTO schema_migrations (version) VALUES ('20160628183610');

INSERT INTO schema_migrations (version) VALUES ('20160628183611');

INSERT INTO schema_migrations (version) VALUES ('20160628183612');

INSERT INTO schema_migrations (version) VALUES ('20160628183613');

INSERT INTO schema_migrations (version) VALUES ('20160628183614');

INSERT INTO schema_migrations (version) VALUES ('20160628183615');

INSERT INTO schema_migrations (version) VALUES ('20160628183616');

INSERT INTO schema_migrations (version) VALUES ('20160628183617');

INSERT INTO schema_migrations (version) VALUES ('20160628183618');

INSERT INTO schema_migrations (version) VALUES ('20160628183619');

INSERT INTO schema_migrations (version) VALUES ('20160628183620');

INSERT INTO schema_migrations (version) VALUES ('20160628183621');

INSERT INTO schema_migrations (version) VALUES ('20160628183622');

INSERT INTO schema_migrations (version) VALUES ('20160628183623');

INSERT INTO schema_migrations (version) VALUES ('20160628183624');

INSERT INTO schema_migrations (version) VALUES ('20160628183625');

INSERT INTO schema_migrations (version) VALUES ('20160628183626');

INSERT INTO schema_migrations (version) VALUES ('20160628183627');

INSERT INTO schema_migrations (version) VALUES ('20160628183628');

INSERT INTO schema_migrations (version) VALUES ('20160628183629');

INSERT INTO schema_migrations (version) VALUES ('20160628183630');

INSERT INTO schema_migrations (version) VALUES ('20160628183631');

INSERT INTO schema_migrations (version) VALUES ('20160628183632');

INSERT INTO schema_migrations (version) VALUES ('20160628183633');

INSERT INTO schema_migrations (version) VALUES ('20160628183634');

INSERT INTO schema_migrations (version) VALUES ('20160628183635');

INSERT INTO schema_migrations (version) VALUES ('20160628183636');

INSERT INTO schema_migrations (version) VALUES ('20160628183637');

INSERT INTO schema_migrations (version) VALUES ('20160628183638');

INSERT INTO schema_migrations (version) VALUES ('20160628183639');

INSERT INTO schema_migrations (version) VALUES ('20160628183640');

INSERT INTO schema_migrations (version) VALUES ('20160628183641');

INSERT INTO schema_migrations (version) VALUES ('20160628183642');

INSERT INTO schema_migrations (version) VALUES ('20160628183643');

INSERT INTO schema_migrations (version) VALUES ('20160628183644');

INSERT INTO schema_migrations (version) VALUES ('20160628183645');

INSERT INTO schema_migrations (version) VALUES ('20160628183646');

INSERT INTO schema_migrations (version) VALUES ('20160628183647');

INSERT INTO schema_migrations (version) VALUES ('20160628183648');

INSERT INTO schema_migrations (version) VALUES ('20160628183649');

INSERT INTO schema_migrations (version) VALUES ('20160628183650');

INSERT INTO schema_migrations (version) VALUES ('20160628183651');

INSERT INTO schema_migrations (version) VALUES ('20160628183652');

INSERT INTO schema_migrations (version) VALUES ('20160628183653');

INSERT INTO schema_migrations (version) VALUES ('20160628183654');

INSERT INTO schema_migrations (version) VALUES ('20160628183655');

INSERT INTO schema_migrations (version) VALUES ('20160628183656');

INSERT INTO schema_migrations (version) VALUES ('20160628183657');

INSERT INTO schema_migrations (version) VALUES ('20160628183658');

INSERT INTO schema_migrations (version) VALUES ('20160628183659');

INSERT INTO schema_migrations (version) VALUES ('20160628183660');

INSERT INTO schema_migrations (version) VALUES ('20160628183661');

INSERT INTO schema_migrations (version) VALUES ('20160628183662');

INSERT INTO schema_migrations (version) VALUES ('20160628183663');

INSERT INTO schema_migrations (version) VALUES ('20160628183664');

INSERT INTO schema_migrations (version) VALUES ('20160628183665');

INSERT INTO schema_migrations (version) VALUES ('20160628183666');

INSERT INTO schema_migrations (version) VALUES ('20160628183667');

INSERT INTO schema_migrations (version) VALUES ('20160628183668');

INSERT INTO schema_migrations (version) VALUES ('20160628183669');

INSERT INTO schema_migrations (version) VALUES ('20160628183670');

INSERT INTO schema_migrations (version) VALUES ('20160628183671');

INSERT INTO schema_migrations (version) VALUES ('20160628183672');

INSERT INTO schema_migrations (version) VALUES ('20160628183673');

INSERT INTO schema_migrations (version) VALUES ('20160628183674');

INSERT INTO schema_migrations (version) VALUES ('20160628183675');

INSERT INTO schema_migrations (version) VALUES ('20160628183676');

INSERT INTO schema_migrations (version) VALUES ('20160628183677');

INSERT INTO schema_migrations (version) VALUES ('20160628183678');

INSERT INTO schema_migrations (version) VALUES ('20160628183679');

INSERT INTO schema_migrations (version) VALUES ('20160628183680');

INSERT INTO schema_migrations (version) VALUES ('20160628183681');

INSERT INTO schema_migrations (version) VALUES ('20160628183682');

INSERT INTO schema_migrations (version) VALUES ('20160628183683');

INSERT INTO schema_migrations (version) VALUES ('20160628183684');

INSERT INTO schema_migrations (version) VALUES ('20160628183685');

INSERT INTO schema_migrations (version) VALUES ('20160628183686');

INSERT INTO schema_migrations (version) VALUES ('20160628183687');

INSERT INTO schema_migrations (version) VALUES ('20160628183688');

INSERT INTO schema_migrations (version) VALUES ('20160628183689');

INSERT INTO schema_migrations (version) VALUES ('20160628183690');

INSERT INTO schema_migrations (version) VALUES ('20160628183691');

INSERT INTO schema_migrations (version) VALUES ('20160628183692');

INSERT INTO schema_migrations (version) VALUES ('20160628183693');

INSERT INTO schema_migrations (version) VALUES ('20160628183694');

INSERT INTO schema_migrations (version) VALUES ('20160628183695');

INSERT INTO schema_migrations (version) VALUES ('20160628183696');

INSERT INTO schema_migrations (version) VALUES ('20160628183697');

INSERT INTO schema_migrations (version) VALUES ('20160628183698');

INSERT INTO schema_migrations (version) VALUES ('20160628183699');

INSERT INTO schema_migrations (version) VALUES ('20160628183700');

INSERT INTO schema_migrations (version) VALUES ('20160628183701');

INSERT INTO schema_migrations (version) VALUES ('20160628183702');

INSERT INTO schema_migrations (version) VALUES ('20160628183703');

INSERT INTO schema_migrations (version) VALUES ('20160628183704');

INSERT INTO schema_migrations (version) VALUES ('20160628183705');

INSERT INTO schema_migrations (version) VALUES ('20160628183706');

INSERT INTO schema_migrations (version) VALUES ('20160628183707');

INSERT INTO schema_migrations (version) VALUES ('20160628183708');

INSERT INTO schema_migrations (version) VALUES ('20160628183709');

INSERT INTO schema_migrations (version) VALUES ('20160628183710');

INSERT INTO schema_migrations (version) VALUES ('20160628183711');

INSERT INTO schema_migrations (version) VALUES ('20160628183712');

INSERT INTO schema_migrations (version) VALUES ('20160628183713');

INSERT INTO schema_migrations (version) VALUES ('20160628183714');

INSERT INTO schema_migrations (version) VALUES ('20160628183715');

INSERT INTO schema_migrations (version) VALUES ('20160628183716');

INSERT INTO schema_migrations (version) VALUES ('20160628183717');

INSERT INTO schema_migrations (version) VALUES ('20160628183718');

INSERT INTO schema_migrations (version) VALUES ('20160628183719');

INSERT INTO schema_migrations (version) VALUES ('20160628183720');

INSERT INTO schema_migrations (version) VALUES ('20160628183721');

INSERT INTO schema_migrations (version) VALUES ('20160628183722');

INSERT INTO schema_migrations (version) VALUES ('20160628183723');

INSERT INTO schema_migrations (version) VALUES ('20160628183724');

INSERT INTO schema_migrations (version) VALUES ('20160628183725');

INSERT INTO schema_migrations (version) VALUES ('20160628183726');

INSERT INTO schema_migrations (version) VALUES ('20160628183727');

INSERT INTO schema_migrations (version) VALUES ('20160628183728');

INSERT INTO schema_migrations (version) VALUES ('20160628183729');

